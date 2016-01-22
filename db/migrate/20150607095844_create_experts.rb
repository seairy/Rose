class CreateExperts < ActiveRecord::Migration
  def change
    create_table :experts do |t|
      t.string :portrait, limit: 100
      t.string :en_name, :zh_name, limit: 100, null: false
      t.text :en_description, :zh_description, limit: 2000
      t.integer :position, limit: 2, null: false
      t.timestamps null: false
    end
  end
end
