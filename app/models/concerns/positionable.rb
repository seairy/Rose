# -*- encoding : utf-8 -*-
module Positionable extend ActiveSupport::Concern
  included do
    default_scope -> { order(:position) }
    before_create :set_position
  end

  def set_position
    self.position ||= (self.class.maximum(:position) || 0) + 1
  end
end