class Like < ApplicationRecord
    belongs_to :upvote, polymorphic: true
end
