class Product < ApplicationRecord
  has_one_attached :image

  belongs_to :category
  belongs_to :subcategory, optional: true

  has_many :order_items

  validates :title, :description, :price, presence: true
end
