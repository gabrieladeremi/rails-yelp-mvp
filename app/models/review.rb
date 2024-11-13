class Review < ApplicationRecord
  belongs_to :restaurant

  validates :content, presence: true
  validates :rating, presence: true, numericality: { in: 1..5, only_integer: true }
  validates_associated :restaurant
end
