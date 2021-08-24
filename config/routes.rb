Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :offers

  resources :bookmarks, only: [:new, :create, :index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :offers, only: [:show]
end
