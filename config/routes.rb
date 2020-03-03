Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :user, only: [:new,:show]
  post 'user/new', action:'create', controller:'user'

  get 'sign_in', to: 'session#new'
  post 'sign_in', to: 'session#create'
end
