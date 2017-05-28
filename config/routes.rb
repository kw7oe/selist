Rails.application.routes.draw do

  # Login and Sign Up Routes
  get 'sign_up', to: 'users#new', as: 'sign_up'
  get 'sign_in', to: 'sessions#new', as: 'sign_in'
  post 'sign_in', to: 'sessions#create'
  get 'sign_out', to: 'sessions#destroy', as: 'sign_out'

  root "static_pages#home"
  resources :users, only: [:new, :create, :edit]
  resources :teachers, except: [:new, :create, :edit]
  resources :students, except: [:new, :create, :edit] do 
    member do 
      put "done"
    end
  end
  resources :sessions
  resources :subjects do 
    resources :lists do 
      resources :tasks 
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
