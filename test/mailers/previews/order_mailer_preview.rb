class OrderMailerPreview < ActionMailer::Preview
  def place_an_order
    OrderMailer.with(order: Order.last).place_an_order.deliver_now
  end
end
