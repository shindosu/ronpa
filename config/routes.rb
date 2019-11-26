Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :topics, only: [:index, :show, :new, :create] do
    resources :participants, only: [:create]
    resources :debates, only: [:create]
    resources :arguments, only: [:create, :update]
  end
  resources :debates, only: [:show, :update] do
    patch '/next_phase', to: "debates#next_phase", as: :next_phase
    patch '/set_result', to: "participants#set_result", as: :set_result
    patch '/set_communication', to: "participants#set_communication", as: :set_communication
    patch '/set_persuasiveness', to: "participants#set_persuasiveness", as: :set_persuasiveness
    patch '/set_civility', to: "participants#set_civility", as: :set_civility
    resources :uses, only: [:create, :update]
  end
  resources :users, only: [:show]
  get 'dashboard', to: 'users#dashboard', as:'dashboard'
  mount ActionCable.server, at: '/cable'
end
