class AddDisplayedInRecommendedToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :displayed_in_recommended, :boolean, null: false, default: false, after: :displayed_in_carousel
  end
end
