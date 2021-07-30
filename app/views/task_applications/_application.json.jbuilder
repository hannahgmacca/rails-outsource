json.extract! task_application, :id, :message, :user_id, :task_id, :created_at, :updated_at
json.url task_application_url(task_application, format: :json)
