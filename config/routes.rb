Rails.application.routes.draw do

  resources :users, only: [:create, :new, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :pitches, except: [:destroy] do
    resources :votes, only: [:create]
  end
  root 'pitches#index'
end
