Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  
  root "pages#home"
  get "pages/home", to: "pages#home"
  
  resources :recipes do
    resources :comments, only: [:create]
  end
    
  resources :users, except: [:new]
  resources :ingredients, except: [:destroy]
  
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "login", to: "sessions#create"
  get "logout", to: "sessions#destroy"
  
  
  mount ActionCable.server => '/cable'




  
end
