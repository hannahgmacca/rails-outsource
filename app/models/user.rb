class User < ApplicationRecord
  # From rubygem
  acts_as_favoritor

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tasks, through: :task_completes # tasks the user completed
  has_many :comments
  has_one_attached :picture 
  has_many :task_applications, dependent: :destroy 

  def has_applied?(task_id)
      if !task_applications.find_by_task_id(task_id).nil?
        true
      end
  end

  def total_completed
      count = TaskApplication.where( user_id: self.id, approved: true ).to_a.count
      return count
  end

  def total_applications_to_be_reviewed
     count = @task_applications = TaskApplication.joins(:task).where(tasks: { user_id: self.id, sourced: nil}, :approved => nil).to_a.count
     return count
  end
end
