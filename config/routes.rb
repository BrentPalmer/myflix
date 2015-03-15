Myflix::Application.routes.draw do
  root 'videos#index'
  get '/home', to: 'videos#index'

  resources :videos do
    collection do
      get '/search', to: 'videos#search'
    end
  end

  resources :categories

  get 'ui(/:action)', controller: 'ui'
end
