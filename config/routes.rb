Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'


  resources :offers, only: [:index, :show] do
    resources :bookmarks, only: [:new, :create, :index]
    resources :reviews, only: [:index, :new, :create]

  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
