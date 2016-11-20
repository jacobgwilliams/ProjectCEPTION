Rails.application.routes.draw do

  resources :users, only: [:create, :new, :show]
  resources :secret_keys, only: [:create, :new]
  resources :sessions, only: [:new, :create, :destroy]
  resources :final_groups, only: [:index]
  resources :pitches, except: [:destroy] do
    resources :votes, only: [:create]
    resources :final_groups, except: [:edit, :update, :destroy, :index]
    post '/create_groups' => 'final_groups#create_groups'
  end
  root 'pitches#index'
  post '/pitch_rankings' => 'pitch_rankings#create_ranking'
  # post '/create_groups' => 'final_groups#create_groups'
end
