Rails.application.routes.draw do
  
  devise_for :users

  root "pages#index"
  
  resources :users, only: [:show]
  resources :posts, only: [:new, :create, :index, :show] do
    resources :photos, only: [:create]
  end
end
