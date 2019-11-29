class User < ApplicationRecord

  before_save { email.downcase! }

  validates :name, presence: true, length: {maximum: 50 }

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                                  format: { with: EMAIL_REGEX },
                                  uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  has_many :active_relationships, class_name: "Relationship",
                                  foreign_key: "follower_id",
                                  dependent: :destroy

  has_many :passive_relationships, class_name: "Relationship",
                                  foreign_key: "followed_id",
                                  dependent: :destroy

  has_many :following, through: :active_relationships, source: :followed
  has_many :follower, through: :passive_relationships, source: :follower

  has_many :lessons, dependent: :destroy

  has_many :activities, dependent: :destroy

  has_many :categories, through: :lessons

  has_many :answers, through: :lessons

# 要は自分がfollowerになりますということ
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # すでにフォローしてるなら2回目をする必要ないですよってこと
  def following?(other_user)
    following.include?(other_user)
  end


  mount_uploader :avatar, AvatarUploader


  def lesson_taken(cat_id)
    lesson = lessons.find_by(category_id: cat_id)
  end
end

