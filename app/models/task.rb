class Task < ApplicationRecord
    belongs_to :user
    has_one :category
    has_many :comments
    has_many :favourites
end
