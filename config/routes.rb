Rails.application.routes.draw do
  namespace :admin do
    resource :session, only: [:new, :create, :destroy]
    resources :dashboards, only: :index
    resource :users, only: :update
    resource :invite, only: [:new, :create]
  end

  resource :session, only: [:new, :create, :destroy]
  resources :users do
    resource :profile, only: [:edit, :update]
  end
end
