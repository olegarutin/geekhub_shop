class Product < ApplicationRecord
  has_one_attached :image

  belongs_to :category
  belongs_to :subcategory, optional: true

  has_many :order_items, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :title, :description, :price, presence: true

  def rating
    return 0 if comments.empty?

    (comments.sum(&:rating).to_f / comments.count)
  end

  def rating_to_star
    '★' * rating.to_i + '☆' * (5 - rating.to_i)
  end
end
