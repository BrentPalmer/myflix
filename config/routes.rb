Myflix::Application.routes.draw do
  root 'users#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  
  resources :videos do
    collection do
      get '/search', to: 'videos#search'
    end
  end

  resources :categories, only: [:show]
  resources :users, only: [:index, :new, :create]

  get 'ui(/:action)', controller: 'ui'
end
