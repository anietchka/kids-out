Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :offers, only: [:new, :create, :index, :show] do
    resources :bookmarks, only: [:create, :destroy]
    resources :reviews, only: [:new, :create, :destroy]
    resources :meetups, only: [:new, :create, :index]

  end

  resources :bookmarks, only: [:index]
  resource :profile, only: [:show]
  resources :participants, only: [:destroy]
  resources :meetups, only: [:show, :destroy, :edit] do
    resources :messages, only: :create
    member do
      get :chat
    end
    collection do
      get :chatrooms
      get :user_meetups
    end
    resources :participants, only: [:create]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
