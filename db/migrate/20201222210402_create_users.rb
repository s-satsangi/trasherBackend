class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :username
      t.string :bio
      t.string :points
      t.string :profile_picture

      t.timestamps
    end
  end
end
