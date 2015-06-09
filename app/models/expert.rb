class Expert < ActiveRecord::Base
  include Positionable
  mount_uploader :portrait, ExpertPortraitUploader
end
