class AddDisplayedInCarouselToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :displayed_in_carousel, :boolean, null: false, default: false, after: :displayed_in_popular
  end
end
