Rails.application.routes.draw do
  # get 'borrowings/new'
  # get 'borrowings/create'
  # get 'borrowings/edit'
  # get 'borrowings/update'
  # get 'borrowings/destroy'
  # get 'items/index'
  # get 'items/show'
  # get 'items/new'
  # get 'items/create'
  # get 'items/edit'
  # get 'items/update'
  # get 'items/destroy'
  # Root path
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
