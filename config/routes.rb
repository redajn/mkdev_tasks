Rails.application.routes.draw do
  root 'events#index'
  resource :event, only: [:new, :create, :show, :index]
end
