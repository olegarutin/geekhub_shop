class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :body, :rating, presence: true
  validates :user_id, uniqueness: { scope: :product, message: 'has already commented on this product' }
  validate :user_ordered_product

  def rating_to_star
    '★' * rating.to_i + '☆' * (5 - rating.to_i)
  end

  private

  def user_ordered_product
    unless user.ordered_products.include?(product)
      errors.add(:user, "didn't order this product")
    end
  end
end
