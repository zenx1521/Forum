Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations'}
  resources :posts do 
    resources :comments , only: [:new,:create,:destroy,:edit,:update]
  end
  resources :users, only: [:show]
  root 'posts#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
