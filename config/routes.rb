Rails.application.routes.draw do

  resources :users, only: [:create, :new, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :pitches, except: [:edit, :update, :destroy]

  root 'pitches#index'
end
