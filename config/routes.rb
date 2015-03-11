Myflix::Application.routes.draw do
  get '/home', to: 'videos#index'

  resources :videos
  resources :categories

  get 'ui(/:action)', controller: 'ui'
end
