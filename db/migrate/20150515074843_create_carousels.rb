class CreateCarousels < ActiveRecord::Migration
  def change
    create_table :carousels do |t|
      t.references :post, null: false
      t.string :cover, limit: 100
      t.string :en_title, :zh_title, limit: 190, null: false
      t.text :en_description, :zh_description, limit: 1000
      t.integer :position, limit: 1, null: false
      t.boolean :visible, null: false
      t.timestamps null: false
    end
  end
end
