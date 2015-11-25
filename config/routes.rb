Rails.application.routes.draw do

  # Dynamic blog:
  resources :post

  # Static pages:
  root :to => 'welcome#index'
  get 'about', to: 'welcome#about'
  get 'resume', to: 'welcome#resume'

  # User accounts:
  # log in
  get 'login', to: 'user#login'
  # sign up
  get 'signup', to: 'user#new'
  # make new user
  post 'signup', to: 'user#create'
  # profile
  get 'profile/:username', to: 'user#show'
  
  # Later, add editing and deletion of profiles (PATCH, DELETE)

end
