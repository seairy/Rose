class Expert < ActiveRecord::Base
  include Multilingual, Positionable
  mount_uploader :portrait, ExpertPortraitUploader
  multilingual :description
end
