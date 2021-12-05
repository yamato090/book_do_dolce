class Recipe < ApplicationRecord
  attachment :image
  
  belongs_to :user
  has_many :images, dependent: :destroy
end
