class Task < ApplicationRecord
    # Show 3 tasks per page (from Kaminari gem)
    paginates_per 3

    # BELOW EXTENSIONS ARE NOT USED IN THIS VERSION OF OUTSOURCE
    # Extend Class Sortable so that tasks can be searched
    # include Sortable::InstanceMethods
    # extend Sortable::ClassMethods 

    # From rubygem
    acts_as_favoritable

    belongs_to :user
    belongs_to :category
    has_many :comments, dependent: :destroy 
    has_many :task_applications, dependent: :destroy 

    # Validations
    validates :title, presence: true
    validates :user, presence: true
    validates :description, presence: true
    validates :category, presence: true

    # Data santization
    before_save :remove_whitespace

    private

    # Check category of self (for category filter)
    def self.by_category(category_id)
        where(category: category_id)
    end

    def remove_whitespace
        self.title = self.title.strip
        self.description = self.description.strip
    end
end

