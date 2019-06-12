Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  root 'sites#index'
  resources :sites, only: [:index, :show, :new, :create]
  get 'populate_me', to: 'sites#populate_me'
  get 'get_long_url', to: 'sites#get_long_url'
  namespace 'api' do
    namespace 'v1' do
      get 'shor', to: 'sites#show'
    end
  end
end
