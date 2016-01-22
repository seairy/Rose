class CreateMagazines < ActiveRecord::Migration
  def change
    create_table :magazines do |t|
      t.string :en_issue, :zh_issue, limit: 50, null: false
      t.string :cover, limit: 100, null: false
      t.string :file, limit: 100, null: false
      t.text :en_description, :zh_description, limit: 2000
      t.integer :position, limit: 2, null: false
      t.timestamps null: false
    end
  end
end
