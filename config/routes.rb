Rails.application.routes.draw do
  root 'sessions#new'
  get 'items/index', to: 'items#index'

  get 'items/new', to: "items#new"
  get 'items/details', to: "items#details"
  get 'items/dismiss', to: "items#dismiss"
  get 'items/fulfill', to: "items#fulfill"

  post 'items/create', to: "items#create"
  post 'items/create_details', to: "items#create_details"
  post 'comments/create_comment', to:"comments#create"
  
  get '/login' => 'sessions#new'
  post'/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get 'authorized', to: 'items#index'

  if Rails.env.development?
    get '/coverage', :to => redirect('/coverage/index.html')
  end
  
end
