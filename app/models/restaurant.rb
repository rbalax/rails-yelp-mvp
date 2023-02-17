class Restaurant < ApplicationRecord
  validates :name, :address, :phone_number,:category, presence: true
  validates :category, inclusion: {in: %w(chinese italian japanese french belgian)}
  has_many :reviews, dependent: :destroy

  def average_rating
    reviews.average(:rating)
  end
end
