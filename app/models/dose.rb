# frozen_string_literal: true

class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient

  validates :description, presence: true
  validates :ingredient, uniqueness: { scope: :cocktail, message: 'This cocktail and this ingredient have already been created together' }
end
