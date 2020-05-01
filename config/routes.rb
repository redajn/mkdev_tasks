# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admins

  namespace :admin do
    root 'admin/events#index'
    resources :events do
      member do
        get 'change_state'
      end
    end
  end

  devise_for :users

  root 'events#index'
  resources :events
end
