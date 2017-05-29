Rails.application.routes.draw do

  # Root Routes
  root "static_pages#home"

  # Login and Sign Up Routes
  get 'sign_up', to: 'users#new', as: 'sign_up'
  get 'sign_in', to: 'sessions#new', as: 'sign_in'
  post 'sign_in', to: 'sessions#create'
  get 'sign_out', to: 'sessions#destroy', as: 'sign_out'

  # Teachers Custom Routes
  get "/teachers/:id/dashboard(.:format)", to: 'teachers#dashboard', as: "dashboard_teacher"
  
  # Students Custom Routes
  get "/students/:id/dashboard(.:format)", to: 'students#dashboard', as: "dashboard_student"
  put "/students/:id/done(.:format)", to: 'students#done', as: "done_student"

  resources :sessions
  resources :users 
  
  resources :subjects do 
    member do 
      get "edit_students"
    end
    resources :lists do 
      resources :tasks 
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
