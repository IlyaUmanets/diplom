Rails.application.routes.draw do
  namespace :admin do
    resource :session, only: [:new, :create, :destroy]
    resources :dashboards, only: :index
    resource :users, only: :update
  end
end
