Rails.application.routes.draw do
  devise_for :users
  authenticated { root to: 'users#dashboard' }
  root to: 'pages#home'
  resources :topics, only: [:index, :show] do
    resources :arguments, only: [:create, :update]
  end
  resources :debates, only: [:show, :create] do
    resources :uses, only: [:create, :update]
  end
  resources :participants, only: [:create]
  resources :users, only: [:show]
  get 'dashboard', to: 'users#dashboard'
end
