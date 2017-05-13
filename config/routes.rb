Rails.application.routes.draw do
  
  get 'homepage/:id', to:'student_home#index'
  put 'task/done/:userId/:taskId',to:'student_home#done'
  root "static_pages#home"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
