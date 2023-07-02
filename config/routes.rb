Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }

  root 'public_recipes#index'
  
  resources :public_recipes, only: [:index]
  resources :users, only:[:index, :show, :edit, :update, :destroy] do
    resources :recipes, only: [:index, :show, :edit, :create, :update, :destroy, :new, :toggle_public] do
      resources :recipe_foods, only: [:index, :show, :edit, :update, :destroy]
      member do
        patch 'toggle_public'
      end
    end
    resources :foods, only: [:index, :new, :show, :edit, :create, :update, :destroy] do
      resources :recipe_foods, only: [:index, :show, :edit, :update, :destroy]
    end
    resources :shopping_lists, only: [:index]
  end
  
  devise_scope :user do
    get 'users/new', to: 'users/registrations#new', as: 'new_user'
  end
  
  get '/sign_out_user', to: 'users#sign_out_user', as: 'sign_out_user'
end