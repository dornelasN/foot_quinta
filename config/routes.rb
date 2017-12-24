Rails.application.routes.draw do
  root 'static_pages#home'
  get '/help',    to: 'static_pages#help'
  get '/about',   to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/contact-me', to: 'messages#new', as: 'new_message'
  post '/contact-me', to: 'messages#create', as: 'create_message'
end
