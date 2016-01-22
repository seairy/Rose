class CreateSubscribers < ActiveRecord::Migration
  def change
    create_table :subscribers do |t|
      t.string :email, limit: 200, null: false
      t.boolean :available, default: true, null: false
      t.datetime :joined_at, null: false
      t.timestamps null: false
    end
  end
end
