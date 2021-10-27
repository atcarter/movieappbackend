class Review < ApplicationRecord
  belongs_to :movie

  validates :rating, numericality: { less_than: 6, greater_than: 0 }
  validates :content, length: { maximum: 500 }
end
