Rails.application.routes.draw do
  devise_for :users
  root to: "letters#index"
  resources :letters
  resources :grades, only: [:index, :new, :create, :destroy, :update, :edit]
  resources :kids, only: [:index, :new, :create, :edit, :update, :destroy]
end
