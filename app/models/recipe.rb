class Recipe < ApplicationRecord
  attachment :image

  belongs_to :user
  
  has_many :favorites       , dependent: :destroy
  has_many :recipe_comments , dependent: :destroy
  
  validates :name           , presence: true,    length: { in: 1..40 }
  validates :description    , presence: true,    length: { in: 1..200 }
  validates :procedure      , presence: true,    length: { in: 5..500 }
  validates :ingredients    , presence: true,    length: { in: 1..200 }
  validates :calories       , presence: true
  validates :cost           , presence: true
  validates :image          , presence: true
  
  def favorited_by?(user)
      favorites.where(user_id: user.id).exists?
  end
  
  def self.search_for(content, method)
    if method == 'perfect'
      Recipe.where(name: content)
    else
      Recipe.where('name LIKE ?', '%'+content+'%')
    end
  end
end
