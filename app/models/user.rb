class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, presence: true, uniqueness: true

  has_many :reviews
  has_many :cocktails

  def can_review?(cocktail)
    cocktail.reviews.none? { |review| review.user_id == self.id }
  end
end
