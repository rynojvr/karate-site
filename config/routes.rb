Rails.application.routes.draw do
  # devise_for :users
  # devise_scope :user do
  #   get 'login', to: 'devise/sessions#new'
  #   post ''
  # end

  devise_for :users, skip: [:sessions]
  devise_scope :user do
    get 'signin', to: 'devise/sessions#new', as: :new_user_session
    get 'signup', to: 'devise/registrations#new'
    post 'signin', to: 'devise/sessions#create', as: :user_session
    match 'signout', to: 'devise/sessions#destroy', as: :destroy_user_session, via: Devise.mappings[:user].sign_out_via
  end

  root 'static_pages#home'

  # post '/login', to: 'static_pages#login_form'
  # get '/login', to: 'static_pages#login'

  authenticate :user do
    resources :clubs do
      resources :members do
        post 'affiliate'
      end


    end
    resources :users
    resources :provinces, param: :slug, constraints: { slug: /[a-z][a-z\-]*[a-z]/ }
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
