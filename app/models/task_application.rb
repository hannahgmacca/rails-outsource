class TaskApplication < ApplicationRecord
  belongs_to :user
  belongs_to :task

  # data santization
  before_save :remove_whitespace

  # data validation
  validates :message, presence: true

  private
  def remove_whitespace
    self.message = self.message.strip
  end
end
