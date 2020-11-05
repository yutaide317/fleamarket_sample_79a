Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users, only: [:index, :show]
  resources :credit_cards, only: [:new]
  root 'items#index'
  resources :items do
    collection do
    get 'category/get_category_children', to: 'items#get_category_children', defaults: { format: 'json' }
    get 'category/get_category_grandchildren', to: 'items#get_category_grandchildren', defaults: { format: 'json' }
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :transactions, only: [:index]
end
