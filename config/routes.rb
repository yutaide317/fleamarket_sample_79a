Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users, only: [:index, :show]
  resources :credit_cards, only: [:new, :create]
  root 'items#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :items, only: [:new]
end
