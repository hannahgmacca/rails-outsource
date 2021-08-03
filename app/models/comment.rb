class Comment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :task
  after_commit :create_notifications, on: :create

  private

end
