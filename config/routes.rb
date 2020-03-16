Rails.application.routes.draw do
  root 'events#index'
  resource :event
end
