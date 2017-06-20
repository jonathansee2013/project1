Rails.application.routes.draw do

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  resources :users
  resources :properties
  resources :reviews
  resources :images

  # get 'properties/index'
  #
  # get 'properties/new'
  #
  # get 'properties/show'
  #
  # get 'properties/create'
  #
  # get 'properties/edit'
  #
  # get 'properties/update'
  #
  # get 'properties/destroy'

  #
  # get 'reviews/index'
  #
  # get 'reviews/new'
  #
  # get 'reviews/show'
  #
  # get 'reviews/create'
  #
  # get 'reviews/edit'
  #
  # get 'reviews/update'
  #
  # get 'reviews/destroy'
  #
  # root to: "users#new"

  # get 'images/index'
  #
  # get 'images/new'
  #
  # get 'images/show'
  #
  # get 'images/create'
  #
  # get 'images/edit'
  #
  # get 'images/update'
  #
  # get 'images/destroy'
end
