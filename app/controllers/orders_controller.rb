class OrdersController < ApplicationController
  before_action :authenticate_user!

  def show
    @items = current_order.order_items.order(created_at: :asc)
  end

  def update
    current_order.update(order_params)
    OrderMailer.with(order: current_order).place_an_order.deliver_now
    current_order.ordered!
    flash.alert = 'Order confirmed'
    redirect_to root_path
  end

  private

  def order_params
    params.permit(:full_name, :email, :phone)
  end
end
