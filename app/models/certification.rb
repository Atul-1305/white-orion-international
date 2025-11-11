class Certification < ApplicationRecord
  has_one_attached :image
  scope :published, -> { where(active: true).order(:sort_order) }
end