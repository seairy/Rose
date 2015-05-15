class Post < ActiveRecord::Base
  include AASM, Multilingual
  belongs_to :category
  mount_uploader :cover, PostCoverUploader
  aasm column: 'state' do
    state :draft, initial: true
    state :published
    state :trashed
    event :publish do
      transitions from: :draft, to: :published
    end
    event :trash do
      transitions to: :trashed
    end
  end
  multilingual :title, :home_description, :description, :content
end