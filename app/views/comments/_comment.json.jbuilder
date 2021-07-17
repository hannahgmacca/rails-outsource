json.extract! comment, :id, :message, :user_id, :task_id, :created_at, :updated_at
json.url comment_url(comment, format: :json)
