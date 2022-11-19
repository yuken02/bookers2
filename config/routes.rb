Rails.application.routes.draw do

  root to: "homes#top"
  get '/home/about', to: 'homes#about', as: '/home/about'
  devise_for :users
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  resources :users, only: [:index, :show, :edit, :update]

  # get 'users/new'
  # get 'users/show'
  # get 'users/edit'
  # get 'books/new'
  # get 'books/index'
  # get 'books/show'
  # get 'books/edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
