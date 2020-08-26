class Opinion < ApplicationRecord
    validates_presence_of :text
    belongs_to :author, class_name: 'User'

    scope :ordered_by_most_recent, -> { order(created_at: :desc) }
end
