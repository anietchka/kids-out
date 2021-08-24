Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :offers, only: [:new, :create, :index, :show] do
    resources :bookmarks, only: [:new, :create, :index, :destroy]
    resources :reviews, only: [:index, :new, :create, :destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
