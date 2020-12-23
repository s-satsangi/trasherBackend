class AddUpvoteIdToLikes < ActiveRecord::Migration[6.0]
  def change
    add_column :likes, :upvote_id, :integer
  end
end
