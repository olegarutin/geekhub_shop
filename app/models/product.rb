class Product < ApplicationRecord
  belongs_to :category

  validates :title, :description, :price, :image, presence: true
end
