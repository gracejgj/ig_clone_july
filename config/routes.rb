Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  devise_scope :user do
    get 'log_out' => to: 'devise/session#destroy', as: :log_out
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'pages#homepage'

  # get '/home', to: 'pages#homepage'
  get '/about', to: 'pages#about'

  get '/search', to: 'searches#index'

  resources :users do
    member do
      get :followings
      get :followers
    end
  end

  resources :posts do
    resources :comments
  end

  resources :relationships
end
