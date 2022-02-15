class Order < ApplicationRecord
  belongs_to :user

  has_many :order_items, dependent: :destroy

  enum status: %i[in_progress ordered canceled]

  def total_price
    sum = 0
    self.order_items.each do |item|
      sum += item.sub_price
    end
    return sum
  end
end
