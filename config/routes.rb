Rails.application.routes.draw do
  get 'home/index'
  root to: "home#index"

  # Routes for approved tasks
    get 'tasks/approved', to: "tasks#approved_task", as: 'approved_task'
    get '/tasks/approved_tasks', to: "tasks#approved_tasks", as: 'approved_tasks'
    get 'tasks/pending_approval', to: "tasks#pending_approval", as: 'to_be_approved'

  # Routes for favourited tasks page
    get 'favourites', to: "tasks#favourites", as: 'favourites'
  
  # Routes for viewing of all tasks, favouriting them and commenting them
  resources :tasks do
    member do
      post 'toggle_favorite', to: "tasks#toggle_favorite"
    end
    resources :comments
  end

  # User profiles page routes
   get 'profile', to: 'user#current_user_profile', as: 'user_profile'
   get 'user/:id', to: 'user#profile', as: 'profile'
  
   # Dashboard route
   get 'dashboard', to: 'user#dashboard', as: 'dashboard'

  resources :comments
  resources :task_applications
  resources :completed_tasks
  resources :categories
  resources :cities

  # Devise routes used for user authentication
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
end
