class Review < ApplicationRecord
  belongs_to :cocktail

  validates :content, :user, :rating, presence: true
  validates :rating, inclusion: { in: 0..5, message: "the rating must be 0, 1, 2, 3, 4, 5" }, numericality: { only_integer: true }
  validates :user, uniqueness: { scope: :rating, message: "This user already gave a review" }
end
