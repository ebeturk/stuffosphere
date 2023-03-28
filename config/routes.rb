Rails.application.routes.draw do

  root 'items#index'
  get   'dashboard', to: 'items#dashboard'

  # Routes for authentication with Devise
  devise_for :users

  # Routes for stuff and borrowing
  resources :items do
    resources :borrowings, only: [:new, :create, :edit, :update, :destroy]
  end

  # resources :borrowings, only: [:index, :show] do
  #   resources reviews, only: [:new, :create]
  # end
end
