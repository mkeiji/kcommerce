Rails.application.routes.draw do

  devise_for :users, path: "", path_names: {sign_in: 'login', sign_up: 'register', sign_out: 'logout'}

  # get "pages/:id", to: "pages#show", as: 'pages', id: /\d+/
  get "pages/:page_path", to: "pages#show", as: 'pages'

  # for cars detailed page
  get "pages/car/:id", to: "pages#show", as: "cars", id: /\d+/

  # for cart
  get "pages/cart/:cart", to: "pages#show", as: "cart"

  # for checkout
  post "pages/checkout/:checkout", to: "pages#show", as: "checkout"

  # for payment
  post "pages/pay/:pay", to: "pages#show", as: "pay"

  # add the show action to resources
  resources :pages, only: [:show]

  root to: 'home#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
