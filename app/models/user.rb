class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         has_many :recipes, dependent: :destroy
         has_many :favorites, dependent: :destroy
         has_many :recipe_comments, dependent: :destroy
         
         validates :first_name, presence: true
         validates :last_name, presence: true
         validates :nickname, presence: true

  def full_name
    self.first_name + " " + self.last_name  # 姓と名の間にスペースを追加
  end

end
