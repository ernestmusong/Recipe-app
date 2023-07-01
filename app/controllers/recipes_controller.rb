class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy toggle_public]

  def index
    @recipes = User.includes(:foods).find(params[:user_id]).recipes
  end

  def show
    @recipe = Recipe.includes(:user).find(params[:id])
    @foods = @recipe.user.foods
  end

  def new
    @recipe = Recipe.new
  end

  def edit; end

  # POST /recipes or /recipes.json
  def create
    @recipe = current_user.recipes.build(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to user_recipes_path(current_user), notice: 'Recipe was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to user_recipes_path(current_user), notice: 'Recipe was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1 or /recipes/1.json
  def destroy
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to user_recipes_path(current_user), notice: 'Recipe was successfully destroyed.' }
    end
  end

  def toggle_public
    @recipe.toggle!(:public)
    redirect_to user_recipe_path(current_user, @recipe)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    @recipe = Recipe.includes(:user).find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public, :user_id)
  end
end
