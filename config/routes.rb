Rails.application.routes.draw do
  get 'signup', to: 'user#new', as: 'signup'
  get 'signin', to: 'session#new', as: 'signin'
  get 'signout', to: 'sessions#destroy', as: 'signout'

  root "static_pages#home"
  resources :users
  resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
