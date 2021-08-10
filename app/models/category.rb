class Category < ApplicationRecord
    has_many :task

    validates :title, presence: true
end
