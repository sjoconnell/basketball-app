Rails.application.routes.draw do

  devise_for :users
  root 'games#index'

  get "/games" => 'games#index'
  get "/games/new" => 'games#new'
  get "/games/:id" => 'games#show'
  post "/games" => 'games#create'
  get "/games/:id/edit" => 'games#edit'
  patch "/games/:id" => 'games#update'
  delete "/games/:id" => 'games#destroy'
  post "/search" => 'games#search'

  get "/profiles" => 'profiles#index'
  get "/profiles/new" => 'profiles#new'
  get "/profiles/:id" => 'profiles#show'
  post "/profiles" => 'profiles#create'
  get "/profiles/:id/edit" => 'profiles#edit'
  patch "/profiles/:id" => 'profiles#update'
  delete "/profiles/:id" => 'profiles#destroy'
  post "/search" => 'profiles#search'

  post "/gamed_users" => 'gamed_users#create' 
  delete "/gamed_users/:id" => 'gamed_users#destroy'

end
