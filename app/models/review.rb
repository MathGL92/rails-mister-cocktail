# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :cocktail
  belongs_to :user

  validates :content, :rating, presence: true
  validates :rating, inclusion: { in: 0..5, message: 'the rating must be 0, 1, 2, 3, 4, 5' }, numericality: { only_integer: true }
  validates_uniqueness_of :user_id, scope: :cocktail_id, message: "You can't review a product more than once", on: 'create'
end
