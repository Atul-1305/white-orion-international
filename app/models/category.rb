class Category < ApplicationRecord
  has_many :subcategories, dependent: :destroy

  # Products directly under this category (subcategory_id: nil)
  has_many :direct_products, -> { where(subcategory_id: nil) }, class_name: "Product", dependent: :destroy

  # Products inside subcategories
  has_many :sub_products, through: :subcategories, source: :products

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "id", "id_value", "name", "status", "updated_at"]
  end
end
