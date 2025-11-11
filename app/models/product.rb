class Product < ApplicationRecord
  belongs_to :category           
  belongs_to :subcategory, optional: true  

  has_one_attached :image

  def display_category
    subcategory&.category || category
  end
end
