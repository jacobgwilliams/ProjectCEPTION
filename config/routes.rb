Rails.application.routes.draw do

  resources :users, only: [:create, :new, :show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :pitches, except: [:destroy] do
    resources :votes, only: [:create]
    resources :final_groups, except: [:edit, :update, :destroy]
  end
  root 'pitches#index'
  post '/pitch_rankings' => 'pitch_rankings#create_ranking'
end
