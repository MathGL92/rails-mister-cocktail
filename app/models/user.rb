class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, presence: true, uniqueness: true

  has_many :cocktails, dependent: :destroy
  has_many :reviews, through: :cocktails
  has_many :favorite_cocktails
  has_many :favorites, through: :favorite_cocktails, source: :cocktail


  def can_review?(cocktail)
    cocktail.reviews.none? { |review| review.user_id == self.id }
  end
end
