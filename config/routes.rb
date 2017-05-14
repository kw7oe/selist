Rails.application.routes.draw do
  
  get 'students/:id', to:'students#show'
  put 'task/done/:user_id/:task_id',to:'students#done'
  get 'subject/:id/:user_id', to:'subject#home'
  root "static_pages#home"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
