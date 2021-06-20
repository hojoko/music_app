class User < ApplicationRecord
    validates :name, presence: true, length: { maximum: 50 }
    validates :email,presence: true, length: { maximum: 255 },uniqueness: true
    validates :password, presence: true
    has_many :posts
    # has_many :likes
end
