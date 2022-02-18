class OrderMailer < ApplicationMailer
  def place_an_order
    @order = params[:order]
    @items = @order.order_items
    mail(to: @order.email, subject: 'Order completed')
  end
end
