Rails.application.routes.draw do

  # get "pages/:id", to: "pages#show", as: 'pages', id: /\d+/
  get "pages/:page_path", to: "pages#show", as: 'pages'

  # for cars detailed page
  get "pages/car/:id", to: "pages#show", as: "cars", id: /\d+/

  # add the show action to resources
  resources :pages, only: [:show]

  root to: 'home#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
