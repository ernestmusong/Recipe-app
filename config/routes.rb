Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }

  root "users#index"

   
  get '/sign_out_user', to: 'users#sign_out_user', as: 'sign_out_user'
end

