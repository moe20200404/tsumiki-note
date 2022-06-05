Rails.application.routes.draw do
  devise_for :users
  root to: "letters#index"
  resources :letters
  resources :child_classes, only: [:index, :new, :create, :destroy, :update, :edit]
  resources :users_children, only: [:index, :new, :create]
end
