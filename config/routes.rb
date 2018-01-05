Rails.application.routes.draw do
  get 'password_resets/new'

  get 'password_resets/edit'

  get 'sessions/new'

  root 'static_pages#home'
  get  '/help',       to: 'static_pages#help'
  get  '/about',      to: 'static_pages#about'
  get  '/contact',    to: 'messages#new', as: 'contact'
  post '/contact',    to: 'messages#create'
  get  '/signup',     to: 'users#new'
  post '/signup',     to: 'users#create'
  get  '/login',      to: 'sessions#new'
  post '/login',      to: 'sessions#create'
  delete '/logout',   to: 'sessions#destroy'
  post '/users/:id',  to: 'users#make_admin', as: 'make_admin'
  resources :users
  resources :password_resets, only: [:new, :create, :edit, :update]
end
