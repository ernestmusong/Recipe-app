require 'rails_helper'

RSpec.describe 'Recipes', type: :request do
  before(:each) do
    @user = User.create(name: 'Test user', email: 'test444@gmail.com', password: '123456',
                        password_confirmation: '123456', confirmation_token: nil, confirmed_at: Time.now)
    @recipe = Recipe.create(name: 'Test recipe', preparation_time: 10.2, cooking_time: 20.3,
                            description: 'Test description', public: true, user_id: @user.id)
    @recipe_two = Recipe.create(name: 'Test recipe Two', preparation_time: 10.2, cooking_time: 20.3,
                                description: 'Test description two', public: true, user_id: @user.id)
    post user_session_path params: { user: { email: @user.email, password: @user.password } }
  end
  describe 'GET /public recipe' do
    it 'returns http success' do
      get public_recipes_path
      expect(response).to have_http_status(200)
    end
    it 'renders the index template' do
      get public_recipes_path
      expect(response).to render_template('index')
    end
    it 'displays the recipe name' do
      get public_recipes_path
      expect(response.body).to include(@user.recipes.first.name)
    end
  end
  describe 'GET /recipes/' do
    it 'returns http success' do
      get user_recipes_path(@user)
      expect(response).to have_http_status(200)
    end
    it 'render the index template' do
      get user_recipes_path(@user)
      expect(response).to render_template('index').or(render_template('recipes/index'))
    end
    it 'displays the recipe name' do
      get user_recipes_path(@user)
      expect(response.body).to include(@user.recipes.first.name)
    end
  end
  describe 'GET /recipes/new' do
    it 'returns http success' do
      get new_user_recipe_path(@user)
      expect(response).to have_http_status(200)
    end
    it 'renders the new template' do
      get new_user_recipe_path(@user)
      expect(response).to render_template('new')
    end
    it 'displays the new recipe form' do
      get new_user_recipe_path(@user)
      expect(response.body).to include('Add New recipe')
    end
  end
  describe 'GET /recipes/:id' do
    it 'returns http success' do
      get user_recipe_path(@user, @recipe)
      expect(response).to have_http_status(200)
    end
    it 'renders the show template' do
      get user_recipe_path(@user, @recipe)
      expect(response).to render_template('show')
    end
    it 'displays the recipe name' do
      get user_recipe_path(@user, @recipe)
      expect(response.body).to include(@recipe.name)
    end
  end
end
