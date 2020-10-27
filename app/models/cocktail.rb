# frozen_string_literal: true

class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  has_many :reviews, dependent: :destroy
  belongs_to :user
  has_one_attached :photo
  has_many :favorite_cocktails
  has_many :favorited_by, through: :favorite_cocktails, source: :user

  validates :name, presence: true, uniqueness: true
end
