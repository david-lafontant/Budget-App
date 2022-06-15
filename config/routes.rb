Rails.application.routes.draw do
  get 'expenses/index'
  get 'expenses/show'
  get 'expenses/new'
  get 'expenses/edit'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
end
