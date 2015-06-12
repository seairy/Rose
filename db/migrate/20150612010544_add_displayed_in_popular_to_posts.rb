class AddDisplayedInPopularToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :displayed_in_popular, :boolean, null: false, default: false, after: :published_at
  end
end
