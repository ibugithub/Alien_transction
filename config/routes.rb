Rails.application.routes.draw do
  devise_for :users
  root "splscreen#index"
  get 'home', to: 'home#index'
  resources :categories
end
