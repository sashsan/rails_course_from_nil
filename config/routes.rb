# frozen_string_literal: true

Rails.application.routes.draw do
  get '/items', to: 'items#index'
end
