class AddPageViewToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :page_view, :integer, null: false, default: 0, after: :displayed_in_recommended
  end
end
