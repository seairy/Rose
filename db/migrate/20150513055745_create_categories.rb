class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :en_name, :zh_name, limit: 50, null: false
      t.string :permalink, limit: 100, null: false
      t.integer :position, limit: 1, null: false
      t.boolean :visible, null: false
      t.timestamps null: false
    end
  end
end