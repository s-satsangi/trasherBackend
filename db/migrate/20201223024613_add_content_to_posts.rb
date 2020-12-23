class AddContentToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :text, :string
    add_column :posts, :image, :string
    add_column :posts, :location, :string
  end
end
