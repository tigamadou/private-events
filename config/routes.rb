Rails.application.routes.draw do
  get 'events/new'
  get 'events', to: 'events#index'
  get 'events/:id', to: 'events#show'
  post 'events/new', to: 'events#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :user, only: [:new,:show]
  post 'user/new', action:'create', controller:'user'

  get 'sign_in', to: 'session#new'
  post 'sign_in', to: 'session#create'
  delete 'sign_out', to: 'session#destroy'
end
