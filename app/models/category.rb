class Category < ActiveRecord::Base
  include Multilingual, Positionable
  has_many :posts
  mount_uploader :icon, CategoryIconUploader
  multilingual :name
  scope :visible, -> { where(visible: true) }
end
