class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :category, null: false
      t.string :en_title, :zh_title, limit: 190, null: false
      t.string :permalink, limit: 190, null: false
      t.string :cover, limit: 100
      t.text :en_home_description, :zh_home_description, limit: 2000
      t.text :en_description, :zh_description, limit: 2000
      t.text :en_content, :zh_content, limit: 30000
      t.string :state, limit: 50, null: false
      t.timestamps null: false
    end
  end
end