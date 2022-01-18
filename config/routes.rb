# frozen_string_literal: true

Rails.application.routes.draw do
  root 'top#show'

  resources :notes, path: 'n', only: %i[index show]
end
