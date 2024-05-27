Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post '/participant', to: 'participants#create'
  post '/poll', to: 'polls#create'
  get '/poll', to: 'polls#show'
  post '/vote', to: 'votes#create'
  get  '/stats', to: 'polls#current_poll_stats'
end
