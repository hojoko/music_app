class Post < ApplicationRecord
  validates :youtube_url, presence: true, length: { minimum: 11 }
  validates :text, presence: true
  belongs_to :user
  has_many :likes
  
  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
