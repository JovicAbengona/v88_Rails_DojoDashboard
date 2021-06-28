Rails.application.routes.draw do
  get 'dojos/index'
  get 'dojos/new'

  post 'dojos' => 'dojos#create'

  root 'dojos#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
