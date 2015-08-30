Rails.application.routes.draw do


  resources :post
  root :to => 'welcome#index'
  get 'about', to: 'welcome#about'
  get 'resume', to: 'welcome#resume'

end
