Rails.application.routes.draw do
  get 'dojos/index'
  get 'dojos/new'
  get 'dojos/:id' => 'dojos#show'
  get 'dojos/:id/edit' => 'dojos#edit'

  post 'dojos' => 'dojos#create'
  patch 'dojos/:id' => 'dojos#update'
  delete 'dojos/:id' => 'dojos#delete'

  get 'dojos/:id/students/new' => 'students#new'
  get 'dojos/:dojo_id/students/:student_id' => 'students#show'
  get 'dojos/:dojo_id/students/:student_id/edit' => 'students#edit'

  post 'dojos/:id/students' => 'students#create'
  patch 'dojos/:id/students' => 'students#update'
  delete 'dojos/:id/students' => 'students#delete'
  

  root 'dojos#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
