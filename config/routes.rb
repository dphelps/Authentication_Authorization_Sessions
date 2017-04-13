Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :demos, only: [:new, :create, :destroy]
  root 'demos#new'
  
  get 'demos/new' => 'demos#new', as: :login
  get 'demos/destroy' => 'demos#destroy', as: :logout
end
