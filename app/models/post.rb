class Post < ApplicationRecord
    belongs_to :user
    has_many :likes, as: :upvote
    has_many :comments
    has_many :users, through: :comments
end
