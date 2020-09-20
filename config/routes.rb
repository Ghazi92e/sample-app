SampleApp::Application.routes.draw do


  get '/signup',  :to => 'users#new'

  get '/contact', :to => 'pages#contact'
  get '/about',   :to => 'pages#about'
  get '/help',    :to => 'pages#help'

  root :to => 'pages#home'

  resources :users
  get '/signup',  :to => 'users#new'
end
