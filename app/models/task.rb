class Task < ApplicationRecord
    # From rubygem
    acts_as_favoritable

    belongs_to :user
    belongs_to :category
    has_many :comments, dependent: :destroy 

    validates :title, presence: true
    validates :user, presence: true
    validates :description, presence: true
    validates :category, presence: true
end
