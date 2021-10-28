class Movie < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates :title, presence: true
  validates :synopsis, length: { in: 20..300}
  validates :year, numericality: { greater_than: 1887 }
  before_validation :titlecase

  private

  def titlecase
    self.title = self.title.titleize
  end
end
