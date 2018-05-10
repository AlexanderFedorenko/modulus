# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'links#new'

  get '/:short_url', to: 'links#visit'

  resources :links, only: [:create, :new, :show], param: :short_url
end
