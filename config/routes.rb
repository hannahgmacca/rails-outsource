Rails.application.routes.draw do
  resources :favourites
  resources :task_completes
  resources :categories
  resources :tasks
  resources :cities
  get 'home/index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
