Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users, only: [:index, :show]
  resources :credit_cards, only: [:new, :create, :show, :destroy]
  root 'items#index'
  resources :items do
    resources :purchases, only: [:new, :create]
  end
  resources :transactions, only: [:index]
end
