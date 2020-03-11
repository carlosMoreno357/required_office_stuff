Rails.application.routes.draw do
  root to: 'items#index'
  get 'items/index', to: 'items#index'

  get 'items/new', to: "items#new"
  post 'items/create', to: "items#create"
  get 'items/dismiss', to: "items#dismiss"
  get 'items/open', to: "items#open"
end
