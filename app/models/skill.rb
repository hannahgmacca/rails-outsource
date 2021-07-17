class Skill < ApplicationRecord
    has_many :users, through: :user_skill
    has_many :user_skills
end
