class ApplicationController < ActionController::Base
  include Pagy::Backend
  before_action :set_products_titles, :set_categories

  SORTING_TYPE = { min: Product.order(price: :asc),
                   max: Product.order(price: :desc),
                   a_z: Product.order(title: :asc),
                   z_a: Product.order(title: :desc) }.freeze

  private

  def set_products_titles
    @products_titles = Product.pluck(:title)
  end

  def set_categories
    @categories = Category.all
  end
end
