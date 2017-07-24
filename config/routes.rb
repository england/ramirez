Rails.application.routes.draw do
  resources :users, only: [:index, :new, :create] do
    resources :transactions, only: [:index, :new, :create]
  end

  match "refill", to: "public#refill", via: [:get, :post]

  root "users#index"
end
