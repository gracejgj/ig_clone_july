Rails.application.routes.draw do
  devise_for :views
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Rails can set root path - localhost:3000
  root "pages#homepage"

  #get "/home", to: "pages#homepage"
  get "/about", to: "pages#about"

  resources :users
  resources :posts do #nested routes
   resources :comments
 end 
end
