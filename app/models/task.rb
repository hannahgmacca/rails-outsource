class Task < ApplicationRecord
    # Extend Class Sortable so that tasks can be searched
    include Sortable::InstanceMethods
    extend Sortable::ClassMethods
    # From rubygem
    acts_as_favoritable

    belongs_to :user
    belongs_to :category
    has_many :comments, dependent: :destroy 
    has_many :task_applications, dependent: :destroy 


    validates :title, presence: true
    validates :user, presence: true
    validates :description, presence: true
    validates :category, presence: true


    def self.all_sort_by_date_skip_first
        self.all_sort_by_date.limit(9)[1..-1]
    end

    def self.by_category(category_id)
        where(category: category_id)
    end
end
