Rails.application.routes.draw do

  get 'sessions/new'

  # Dynamic blog:
  resources :post
  get 'continue_post', to: 'post#continue', as: 'continue_post'

  # Static pages:
  root :to => 'welcome#index'
  get 'about', to: 'welcome#about'
  get 'resume', to: 'welcome#resume'
  get 'projects', to: 'welcome#projects'

  # User accounts:
  # sign up
  get 'signup', to: 'user#new'
  # make new user
  post 'signup', to: 'user#create'
  # profile
  get 'profile/:username', to: 'user#show', as: 'profile'
  # Later, add editing and deletion of profiles (PATCH, DELETE)

  # Sessions:
  # log in
  get 'login', to: 'sessions#new'
  # begin new session
  post 'login', to: 'sessions#create'
  # log out
  get 'logout', to: 'sessions#destroy'
  # admin
  get 'admin', to: 'admin#index'


end
