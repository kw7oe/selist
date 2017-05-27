Rails.application.routes.draw do

  get 'sign_up', to: 'users#new', as: 'sign_up'
  get 'sign_in', to: 'sessions#new', as: 'sign_in'
  post 'sign_in', to: 'sessions#create'
  get 'sign_out', to: 'sessions#destroy', as: 'sign_out'
  put 'task/done/:user_id/:task_id',to:'students#done'
  get 'subject/:id/:user_id', to:'subject#home'

  root "static_pages#home"
  resources :users, only: [:new, :create, :edit]
  resources :teachers, except: [:new, :create, :edit]
  resources :students, except: [:new, :create, :edit]
  resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
