class User < ApplicationRecord
    has_many :posts
    has_many :posts, through: :comments, as: :post_comments
    has_many :likes
    has_many :posts, through: :likes, as: :liked_posts
    has_many :comments, through: :likes, as: :liked_comments
    has_secure_password
end
