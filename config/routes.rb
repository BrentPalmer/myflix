Myflix::Application.routes.draw do
  root 'users#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  
  resources :videos do
    collection do
      get '/search', to: 'videos#search'
    end

    resources :reviews, only: [:create]
  end

  resources :categories, only: [:show]
  resources :users, only: [:index, :new, :create]

  get 'my_queue', to: 'queue_items#index'
  get 'ui(/:action)', controller: 'ui'
end
