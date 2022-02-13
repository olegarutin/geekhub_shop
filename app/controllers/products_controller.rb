class ProductsController < ApplicationController
  before_action :set_product, only: %i[show]

  def index
    @sort_type = params[:sort] || 'min'
    @products = SORTING_TYPE[@sort_type.to_sym]

    if params[:range_start]
      @products = @products.where('price BETWEEN ? AND ?', params[:range_start], params[:range_end]).order(price: :asc)
    elsif params[:search]
      @products = @products.where('title ILIKE ?', "%#{params[:search]}%")
    end

    @pagy, @products = pagy(@products, items: 8)
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end
end
