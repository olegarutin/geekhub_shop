class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :body, presence: true
  validate :comment_with_rating

  def rating_to_star
    '★' * rating.to_i + '☆' * (5 - rating.to_i)
  end

  private

  def comment_with_rating
    return if user.comments.map(&:rating).compact.count <= 1

    errors.add(:user, 'has comment with rating')
  end
end
