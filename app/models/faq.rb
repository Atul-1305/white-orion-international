class Faq < ApplicationRecord
  validates :question, presence: true
  validates :answer, presence: true
  validates :position, numericality: { only_integer: true }, allow_nil: true
end
