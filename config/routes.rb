Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :instruments, only: [:index, :show, :new, :create] do
    resources :bookings, only: [:new, :create]
  end
  get "/instruments_search", to: "instruments#search", constraints: { format: 'json' }

  resources :bookings, only: [:index] do
    get "/confirmation", to: "bookings#confirmation"
    patch "/accept", to: "bookings#accept", as: "accept"
    patch "/reject", to: "bookings#reject", as: "reject"
  end
  # generic page for confirmation
end
