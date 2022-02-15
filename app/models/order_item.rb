class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  def sub_price
    self.quantity * self.product.price
  end
end
