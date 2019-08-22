Rails.application.routes.draw do

  # get 'dashboards/show'
  devise_for :users
  # resources :users, only: [:create]

  root to: 'pages#home'
  get "/dashboard", to: "dashboards#show"

  resources :beasts, only: [:create, :index, :new, :update, :show, :destroy] do
    resources :bookings, except: [:create, :index, :new, :update, :show] do
      resources :reviews, only: [:create, :new]
    end
  end
end
