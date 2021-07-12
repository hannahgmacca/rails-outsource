class Task < ApplicationRecord
    
    belongs_to :user
    belongs_to :category
    has_many :comments
    has_many :favourites

    validates :title, presence: true
    validates :user, presence: true
    validates :description, presence: true
    validates :category, presence: true
end
