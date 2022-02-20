class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :body, :rating, presence: true
  validates :user_id, uniqueness: { scope: :product, message: 'has already commented on this product' }

  def rating_to_star
    '★' * rating.to_i + '☆' * (5 - rating.to_i)
  end
end
