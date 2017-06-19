Rails.application.routes.draw do

  root to: "users#new"

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  resources :users


end
