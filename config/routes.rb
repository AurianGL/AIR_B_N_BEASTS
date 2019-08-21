Rails.application.routes.draw do

  get 'dashboards/show'
  devise_for :users
  # resources :users, only: [:create]

  root to: 'pages#home'
  get "/dashboard", to: "dashboard#show"
   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :beasts, only: [:create, :index, :new, :update, :show] do
    resources :bookings, only: [:create, :new, :update, :show]
  end
end
