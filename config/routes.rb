# frozen_string_literal: true

Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  root 'top#show'

  resources :notes, path: 'n', param: 'number', only: %i[index show]
end
