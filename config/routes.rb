Rails.application.routes.draw do
  root to: 'items#index'
  get 'items/index', to: 'items#index'

  get 'items/new', to: "items#new"
  get 'items/comment', to: "items#comment"
  get 'items/dismiss', to: "items#dismiss"
  get 'items/fulfill', to: "items#fulfill"

  post 'items/create', to: "items#create"
  post 'items/create_comment', to: "items#create_comment"
end
