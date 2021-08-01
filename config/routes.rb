Rails.application.routes.draw do
    get 'tasks/approved', to: "tasks#approved_task", as: 'approved_task'
    get '/tasks/approved_tasks', to: "tasks#approved_tasks", as: 'approved_tasks'
    get '/to_be_approved', to: "home#to_be_approved", as: 'to_be_approved_tasks'
  resources :tasks do
    member do
    post 'toggle_favorite', to: "tasks#toggle_favorite"
    end
    resources :comments
  end
  resources :comments
  resources :task_applications
  resources :completed_tasks
  resources :categories
  resources :cities
  get 'home/index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
end
