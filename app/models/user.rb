class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

          has_many :recipes       , dependent: :destroy
          # いいね
          has_many :favorites     , dependent: :destroy
          # レシピコメント
          has_many :recipe_comments, dependent: :destroy
          # フォローをした、されたの関係
          has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
          has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
          # 一覧画面で使う
          has_many :followings    , through: :relationships, source: :followed, dependent: :destroy
          has_many :followers     , through: :reverse_of_relationships, source: :follower, dependent: :destroy

          validates :first_name   , presence: true,    length: { in: 1..20 }
          validates :last_name    , presence: true,    length: { in: 1..20 }
          validates :nickname     , uniqueness: true,    length: { in: 1..30 }
          
          VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
          validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }


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

          def self.search_for(content, method)
            if method == 'perfect'
              User.where(nickname: content)
            else
              User.where('nickname LIKE ?', '%' + content + '%')
            end
          end

  def full_name
    self.first_name + " " + self.last_name  # 姓と名の間にスペースを追加
  end
end
