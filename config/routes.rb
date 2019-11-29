Rails.application.routes.draw do
  get 'categories/index'
  root 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get  '/signup',  to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  namespace :admin do
    get '/home', to: 'users#home'
    resources :users
    resources :categories do
      resources :words
    end
  end

  resources :lessons do
    resources :answers
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :lessons, only: [:show]
  resources :categories, only: [:index]
  resources :users
  resources :relationships, only: [:create, :destroy]
  resources :words, only: [:index]
end
