Rails.application.routes.draw do

  root to: "homes#top"
  devise_for :users
  resources :books
  resources :users

  # get 'users/new'
  # get 'users/show'
  # get 'users/edit'
  # get 'books/new'
  # get 'books/index'
  # get 'books/show'
  # get 'books/edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
