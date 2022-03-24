class Product < ApplicationRecord
  has_many_attached :images

  belongs_to :category
  belongs_to :subcategory, optional: true

  has_many :order_items, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :title, :description, :price, presence: true

  def rating
    values = comments.map(&:rating).compact

    return 0 if comments.empty? || values.empty?

    values.sum.to_f / values.size
  end

  def rating_to_star
    '★' * rating.to_i + '☆' * (5 - rating.to_i)
  end
end
