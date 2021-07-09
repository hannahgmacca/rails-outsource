class Category < ApplicationRecord
    has_many :task

    validates :title, presence: true
    validates :description, presence: true
end
