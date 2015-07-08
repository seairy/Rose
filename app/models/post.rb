class Post < ActiveRecord::Base
  include AASM, Multilingual
  attr_accessor :published_at_date
  attr_accessor :published_at_time
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
    event :restore do
      transitions from: :trashed, to: :draft
    end
  end
  multilingual :title, :home_description, :description, :content
  scope :search, ->(keyword) { where("en_title LIKE '%#{keyword}%' OR zh_title LIKE '%#{keyword}%'") }
  scope :displayed_in_carousel, -> { where(displayed_in_carousel: true) }
  scope :displayed_in_recommended, -> { where(displayed_in_recommended: true) }
  scope :latest, -> { order(published_at: :desc) }

  def visit!
    update!(page_view: self.page_view + 1)
  end
end