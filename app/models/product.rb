class Product < ApplicationRecord
  belongs_to :category
  belongs_to :subcategory, optional: true

  has_many :order_items

  validates :title, :description, :price, :image, presence: true
end
