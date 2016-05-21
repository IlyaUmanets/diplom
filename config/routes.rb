Rails.application.routes.draw do
  root 'dashboards#index'

  resources :dashboards, only: :index
  resource :session, only: [:new, :create, :destroy]
  resources :users do
    resource :profile, only: [:edit, :update]
  end

  namespace :admin do
    resource :session, only: [:new, :create, :destroy]
    resources :dashboards, only: :index
    resource :users, only: :update
    resource :invite, only: [:new, :create]
  end
end
