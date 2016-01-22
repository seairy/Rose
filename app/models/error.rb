# -*- encoding : utf-8 -*-
class Error < ActiveRecord::Base
  scope :sorted, -> { order(created_at: :desc) }
end