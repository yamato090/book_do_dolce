class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
          has_many :recipes, dependent: :destroy
          # いいね
          has_many :favorites, dependent: :destroy
          # レシピコメント
          has_many :recipe_comments, dependent: :destroy
          # フォローをした、されたの関係
          has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
          has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
          # 一覧画面で使う
          has_many :followings, through: :relationships, source: :followed
          has_many :followers, through: :reverse_of_relationships, source: :follower
         
          validates :first_name, presence: true
          validates :last_name, presence: true
          validates :nickname, presence: true
         
          # フォローしたときの処理
          def follow(user_id)
            relationships.create(followed_id: user_id)
          end
          # フォローを外すときの処理
          def unfollow(user_id)
            relationships.find_by(followed_id: user_id).destroy
          end
          # フォローしているか判定
          def following?(user)
            followings.include?(user)
          end

  def full_name
    self.first_name + " " + self.last_name  # 姓と名の間にスペースを追加
  end

end
