Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :offers, only: [:new, :create, :index, :show] do
    resources :bookmarks, only: [:create, :destroy]
    resources :reviews, only: [:new, :create, :destroy]
    resources :meetups, only: [:new, :create, :show, :destroy] do
      resources :participants, only: [:new, :create]
    end
  end

  resources :bookmarks, only: [:index]
  resources :participant, only: [:destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
