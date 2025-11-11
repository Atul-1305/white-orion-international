class Brochure < ApplicationRecord
  has_one_attached :file
  validates :title, presence: true
end
