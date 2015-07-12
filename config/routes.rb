Rails.application.routes.draw do

  devise_for :users
  root 'games#index'

  get "/games" => 'games#index'
  get "/games/new" => 'games#new'
  get "/games/:id" => 'games#show'
  post "/games" => 'games#create'
  get "/games/:id/edit" => 'games#edit'
  patch "/games/:id" => 'games#update'
  delete "/games/:id" => 'geams#destroy'
  post "/search" => 'games#search' 

end
