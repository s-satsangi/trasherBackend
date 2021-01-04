class Like < ApplicationRecord
    belongs_to :upvote, polymorphic: true
    validates :user_id, uniqueness: {scope: :upvote_id}
end
