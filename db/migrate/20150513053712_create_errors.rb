# -*- encoding : utf-8 -*-
class CreateErrors < ActiveRecord::Migration
  def change
    create_table :errors do |t|
      t.string :caller, limit: 100, null: false
      t.string :name, limit: 200, null: false
      t.text :message, :backtrace
      t.timestamps null: false
    end
  end
end
