# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :notes
  end
  root 'top#show'

  get 'login', to: 'sessions#new'
  post 'sessions', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :notes, path: 'n', param: 'number', only: %i[index show]
end
