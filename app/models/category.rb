class Category < ActiveRecord::Base
  include Multilingual
  has_many :posts
  multilingual :name
end
