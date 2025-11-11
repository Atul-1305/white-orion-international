# app/models/about_section.rb
class AboutSection < ApplicationRecord
  enum section_type: { story: 0, mission: 1, vision: 2 }

  has_one_attached :image
  validates :title, :content, presence: true
end
