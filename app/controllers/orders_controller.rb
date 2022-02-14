class OrdersController < ApplicationController
  before_action :authenticate_user!

  def show
    @items = current_order.order_items.order(created_at: :asc)
  end

  def update
    # create a pass parameters method
    current_order.update(full_name: params[:full_name], email: params[:email], phone: params[:phone], status: params[:status])
    current_order.destroy
    flash.alert = 'Order confirmed'
    redirect_to root_path
  end

  private

  # def order_params
  #   params.require(:order).permit(:full_name, :email, :phone, :status)
  # end
end
