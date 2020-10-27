# frozen_string_literal: true

class Ingredient < ApplicationRecord
  has_many :doses
  validates :name, presence: true, uniqueness: true
end
