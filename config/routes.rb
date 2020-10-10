Rails.application.routes.draw do
  devise_for :users
  get 'users/index'
  get 'show' ,to: 'items#show'
  root 'items#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
