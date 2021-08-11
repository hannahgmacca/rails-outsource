class User < ApplicationRecord
  # From rubygem
  acts_as_favoritor

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tasks # tasks the user has posted
  has_many :comments, dependent: :destroy
  has_one_attached :picture 
  has_many :task_applications, dependent: :destroy 

  # data santisation
  before_save :remove_whitespace

  # input validation
  validates :first_name, presence: true
  validates :surname, presence: true

  # returns total number of application user needs to review
  def total_applications_to_be_reviewed
    count = @task_applications = TaskApplication.joins(:task).where(tasks: { user_id: self.id, sourced: nil}, :approved => nil).to_a.count
    return count
  end

  # Checks if user has already sent an application for a task
  def has_applied?(task_id)
    if !task_applications.find_by_task_id(task_id).nil?
      true
    end
  end
  
  # returns total number of tasks user has completed 
  def total_completed
      count = TaskApplication.where( user_id: self.id, approved: true ).to_a.count
      return count
  end

  private 
  
  def remove_whitespace
    self.first_name = self.first_name.strip
    self.surname = self.surname.strip
    # devise automatically sanitises user email
  end

end
