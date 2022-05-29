Rails.application.routes.draw do
  devise_for :users
  root to: "letters#index"
  resources :letters, only: [:index, :new, :create, :edit, :update, :destroy]
end
