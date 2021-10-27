class Movie < ApplicationRecord
  has_many :reviews

  validates :title, presence: true
  validates :synopsis, length: { in: 20..300}
  validates :year, numericality: { greater_than: 1890 }
  before_validation :titlecase

  private

  def titlecase
    self.title = self.title.titleize
  end
end
