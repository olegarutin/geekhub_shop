class ApplicationController < ActionController::Base
  include Pagy::Backend
  before_action :set_products_titles, :set_categories
  helper_method :current_order

  SORTING_TYPE = { min: Product.order(price: :asc),
                   max: Product.order(price: :desc),
                   a_z: Product.order(title: :asc),
                   z_a: Product.order(title: :desc) }.freeze

  def current_order
    Order.find_or_create_by(user: current_user)
  end

  private

  def set_products_titles
    @products_titles = Product.pluck(:title)
  end

  def set_categories
    @categories = Category.all
  end
end
