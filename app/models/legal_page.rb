class LegalPage < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :page_type, presence: true, uniqueness: true
  validates :status, presence: true

  enum page_type: { privacy_policy: 0, terms_and_conditions: 1 }
  enum status: { draft: 0, published: 1 }
end
