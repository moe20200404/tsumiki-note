Rails.application.routes.draw do
  devise_for :users
  root to: "letters#index"
  resources :letters
  resources :grades, only: [:index, :new, :create, :update, :edit]
  resources :kids,except:[:destroy] do
    resources :growths, only: [:index, :new, :create]
  end
  resources :growths do
     collection {post :import}
     collection {get :export}
  end
  resources :users, only: [:index, :update, :show] do
    collection {post :admit}
  end
end
