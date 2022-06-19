Rails.application.routes.draw do
  devise_for :users
  root to: "letters#index"
  resources :letters
  resources :grades, only: [:index, :new, :create, :destroy, :update, :edit]
  resources :kids do
    resources :growths, only: [:index, :new, :create]
  end
  resources :growths do
     collection {post :import}
     collection {get :export}
  end
  resources :users, only: [:index, :update] do
    collection {post :admit}
  end
end
