Rails.application.routes.draw do
  root 'home#index'
  get 'home/index'

  resources :product_subscribers
  resources :product_prices
  resources :currencies
  resources :companies do
    resources :products
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
