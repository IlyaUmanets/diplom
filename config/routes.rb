Rails.application.routes.draw do
  root 'tests#index'

  resource :session, only: [:new, :create, :destroy]
  resources :users do
    resources :profiles, only: [:edit, :update]
  end

  resources :tests, only: :index do
    resources :user_tests, except: [:edit, :update]
  end

  namespace :admin do
    resource :session, only: [:new, :create, :destroy]
    resources :dashboards, only: :index
    resource :users, only: :update
    resource :invite, only: [:new, :create]
    resources :tests
  end
end
