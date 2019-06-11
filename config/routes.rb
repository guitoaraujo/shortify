Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  root 'sites#index'
  resources :sites, only: [:index, :new, :create]
end
