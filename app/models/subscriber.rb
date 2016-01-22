class Subscriber < ActiveRecord::Base
  class << self
    def toggle email
      self.where(email: email).first.tap do |subscriber|
        subscriber.try(:toggle!, :available)
      end || create!(email: email, joined_at: Time.now)
    end
  end
end