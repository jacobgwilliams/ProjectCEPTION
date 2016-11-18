Rails.application.routes.draw do
  resources :pitches, except: [:edit, :update, :destroy]

  root 'pitches#index'
end
