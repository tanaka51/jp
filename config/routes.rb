# frozen_string_literal: true

Rails.application.routes.draw do
  get 'notes/index'
  get 'notes/show'
  root 'top#show'
end
