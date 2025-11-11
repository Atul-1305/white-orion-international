class Director < ApplicationRecord
  has_one_attached :photo
  validates :name, :position, :bio, presence: true

  default_scope { order(:sort_order) } 
end
