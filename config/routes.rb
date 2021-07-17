Rails.application.routes.draw do
  resources :comments
  resources :applications
  resources :skills
  resources :favourites
  resources :task_completes
  resources :categories
  resources :tasks
  resources :cities
  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'

  }
end
