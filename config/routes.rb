Rails.application.routes.draw do
  
  get 'homepage/:id', to:'student#home'
  put 'task/done/:userId/:taskId',to:'student#done'
  get 'subject/:id/:userId', to:'subject#home'
  root "static_pages#home"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
