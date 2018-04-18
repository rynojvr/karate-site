Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#login'
  post '/login', to: 'static_pages#login_form'
  get '/login', to: 'static_pages#login'

  resources :clubs
  resources :members
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
