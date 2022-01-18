# frozen_string_literal: true

Rails.application.routes.draw do
  root 'top#show'

  resources :notes, path: 'n', param: 'number', only: %i[index show]
end
