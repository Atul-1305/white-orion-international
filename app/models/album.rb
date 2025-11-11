class Album < ApplicationRecord
  has_many_attached :images
    attr_accessor :remove_image_ids

end
