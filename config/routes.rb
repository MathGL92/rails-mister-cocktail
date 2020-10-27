# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :cocktails, only: %i[index show new create] do
    resources :doses, only: [:create]
    resources :reviews, only: %i[create edit update]
  end

  resources :cocktails do
    put :favorite, on: :member
  end

  resources :doses, only: [:destroy]

  resources :users, only: [:show] do
    resources :dashboard, only: [:index]
  end

  root 'cocktails#index'
end
