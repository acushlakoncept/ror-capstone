class Opinion < ApplicationRecord
  validates_presence_of :text
  validates :text, length: { minimum: 3, maximum: 180 }
  belongs_to :author, class_name: 'User'
  has_many :likes, dependent: :destroy

  scope :ordered_by_most_recent, -> { includes(:author, :likes).order(created_at: :desc) }
end
