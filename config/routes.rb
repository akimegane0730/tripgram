Rails.application.routes.draw do
  
  devise_for :users

  root "posts#index"
  
  resources :users, only: [:show]
  resources :posts, only: [:new, :create, :index, :show] do
    resources :photos, only: [:create]

    resources :likes, only: [:create, :destroy]
  end
end
