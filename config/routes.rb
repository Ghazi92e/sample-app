SampleApp::Application.routes.draw do
  get 'users/new'

  get '/signup',  :to => 'users#new'

  get '/contact', :to => 'pages#contact'
  get '/about',   :to => 'pages#about'
  get '/help',    :to => 'pages#help'

  root :to => 'pages#home'
end
