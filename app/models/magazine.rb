class Magazine < ActiveRecord::Base
  include Multilingual, Positionable
  mount_uploader :cover, MagazineCoverUploader
  mount_uploader :file, MagazineFileUploader
  multilingual :issue
end