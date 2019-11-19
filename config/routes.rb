Rails.application.routes.draw do
  devise_for :users
  authenticated { root to: 'users#dashboard' }
  root to: 'pages#home'
  resources :topics, only: [:index, :show] do
    resources :arguments, only: [:create]
  end
  resources :debates, only: [:show, :create] do
    resources :participants, only: [:create]
    resources :uses, only: [:create, :update]
  end
  resources :users, only: [:show]
end
