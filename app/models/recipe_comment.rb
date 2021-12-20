class RecipeComment < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  validates :comment, presence: true,    length: { in: 1..50 }
end
