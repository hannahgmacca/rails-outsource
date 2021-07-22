class User < ApplicationRecord
  # From rubygem
  acts_as_favoritor

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :city
  has_many :tasks, through: :task_completes # tasks the user completed
  has_many :comments
  has_one_attached :picture 
end
