Rails.application.routes.draw do
  
  devise_for :users

  root "pages#index"
  
  resources :users, only: [:show]
  resources :posts, only: [:index, :show]
end
