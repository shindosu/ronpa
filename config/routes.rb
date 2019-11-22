Rails.application.routes.draw do
  devise_for :users
  authenticated { root to: 'users#dashboard' }
  root to: 'pages#home'
  resources :topics, only: [:index, :show] do
    resources :participants, only: [:create]
    resources :debates, only: [:create]
    resources :arguments, only: [:create, :update]
  end
  resources :debates, only: [:show, :update] do
    patch '/next_phase', to: "debates#next_phase", as: :next_phase
    resources :uses, only: [:create, :update]
  end
  resources :users, only: [:show]
  get 'dashboard', to: 'users#dashboard', as:'dashboard'
end
