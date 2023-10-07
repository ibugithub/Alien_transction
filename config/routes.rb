Rails.application.routes.draw do
  devise_for :users
  root "splscreen#index"
  resources :categories do
    resources :expenses  
  end
end
