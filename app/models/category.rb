class Category < ActiveRecord::Base
  include Multilingual
  has_many :posts
  mount_uploader :icon, CategoryIconUploader
  multilingual :name
end
