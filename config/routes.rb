Rails.application.routes.draw do
  devise_for :users
  get 'users/index'
  root 'items#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :items, only: [:new]
end
