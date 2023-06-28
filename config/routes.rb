Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }

  root 'users#index'
  
  resources :users, only:[:index, :show, :edit, :update, :destroy] do
    resources :recipes, only: [:index, :show, :edit, :update, :destroy] do
      resources :recipe_foods, only: [:index, :show, :edit, :update, :destroy]
    end
    resources :foods, only: [:index, :show, :edit, :update, :destroy] do
      resources :recipe_foods, only: [:index, :show, :edit, :update, :destroy]
    end
  end
  
  devise_scope :user do
    get 'users/new', to: 'users/registrations#new', as: 'new_user'
  end
  
  get '/sign_out_user', to: 'users#sign_out_user', as: 'sign_out_user'
end