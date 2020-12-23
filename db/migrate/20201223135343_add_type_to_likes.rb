class AddTypeToLikes < ActiveRecord::Migration[6.0]
  def change
    add_column :likes, :upvote_type, :string
  end
end
