Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :beasts, only: [:create, :new, :update, :show] do
    resources :bookings, only: [:create, :new, :update, :show]
  end
end
