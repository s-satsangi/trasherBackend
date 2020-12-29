class Like < ApplicationRecord
    validates :user_id, uniqueness: {scope: :upvote_id}
    belongs_to :upvote, polymorphic: true
end
