class Recipe < ApplicationRecord
  attachment :image

  belongs_to :user
  
  has_many :favorites, dependent: :destroy
  has_many :recipe_comments, dependent: :destroy
  
  validates :name, presence: true
  validates :description, presence: true
  validates :procedure, presence: true
  validates :ingredients, presence: true
  validates :calories, presence: true
  validates :cost, presence: true
  validates :image, presence: true
  
  def favorited_by?(user)
      favorites.where(user_id: user.id).exists?
  end
end
