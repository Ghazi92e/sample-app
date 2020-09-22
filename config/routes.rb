SampleApp::Application.routes.draw do
  get 'sessions/new'

  get '/signup',  :to => 'users#new'
  get '/contact', :to => 'pages#contact'
  get '/about',   :to => 'pages#about'
  get '/help',    :to => 'pages#help'

  root :to => 'pages#home'

  resources :users

  resources :sessions, :only => [:new, :create, :destroy]
  get '/signup',  :to => 'users#new'
  get '/signin',  :to => 'sessions#new'
  get '/signout', :to => 'sessions#destroy'
end
