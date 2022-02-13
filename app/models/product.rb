class Product < ApplicationRecord
  belongs_to :category
  belongs_to :subcategory, optional: true

  validates :title, :description, :price, :image, presence: true
end
