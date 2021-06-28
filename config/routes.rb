Rails.application.routes.draw do
  get 'dojos/index'
  get 'dojos/new'
  get 'dojos/:id' => 'dojos#show'
  get 'dojos/:id/edit' => 'dojos#edit'

  post 'dojos' => 'dojos#create'
  patch 'dojos/:id' => 'dojos#update'
  delete 'dojos/:id' => 'dojos#delete'

  root 'dojos#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
