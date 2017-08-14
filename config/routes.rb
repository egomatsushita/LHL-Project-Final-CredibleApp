Rails.application.routes.draw do

  root 'welcome#index'
  get 'welcome/index'
  # sign up a new user
  get '/register', to: 'users#new'

  resources :users, only: [:new, :create, :index, :show, :destroy]

  namespace :admin do
    root to: 'reviews#index'
    resources :reviews, only: [:index, :destroy, :edit]
    resources :users, only: [:index, :destroy]
    resources :categories, only: [:index, :new, :create, :destroy]
    resources :flags, only: [:index]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   # these routes are for showing users a login form, logging them in, and logging them out.
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users

  resources :reviews, only: [:create, :destroy]
end
