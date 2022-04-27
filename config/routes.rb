Rails.application.routes.draw do
  # get '/articles', to: 'articles#index'
  # resources :articles # generates routes for all CRUD operations
  resources :articles, only: [:index]
end
