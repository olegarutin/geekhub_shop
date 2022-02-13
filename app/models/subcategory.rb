class Subcategory < ApplicationRecord
  validates :title, presence: true

  has_many :products, dependent: :destroy

  belongs_to :category
end
