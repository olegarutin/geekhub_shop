class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :body, presence: true
  validates :rating, presence: { scope: :user_id }, allow_nil: true

  def rating_to_star
    '★' * rating.to_i + '☆' * (5 - rating.to_i)
  end
end
