Rails.application.routes.draw do
  root 'sites#index'
  resources :sites, except: [:edit, :update, :destroy]
end
