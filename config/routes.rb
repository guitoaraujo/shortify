Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  root 'sites#index'
  resources :sites, only: [:index, :new, :create]
  namespace 'api' do
    namespace 'v1' do
      get 'shor', to: 'sites#show'
    end
  end
end
