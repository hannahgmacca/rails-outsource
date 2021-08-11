class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :task

  # data santization
  before_save :remove_whitespace
  
  validates :message, presence: :true

  private

  def remove_whitespace
    self.message = self.message.strip
  end
end
