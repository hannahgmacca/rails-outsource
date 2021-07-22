json.extract! task, :id, :title, :description, :price, :task, :user, :created_at, :updated_at
json.url task_url(task, format: :json)