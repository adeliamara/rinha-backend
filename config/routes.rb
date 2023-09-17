Rails.application.routes.draw do
  get '/contagem-pessoas', to: 'people#count'
  get '/pessoas', to: 'people#index'
  get '/pessoas/:id', to: 'people#show'
  post '/pessoas', to: 'people#create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"


end
