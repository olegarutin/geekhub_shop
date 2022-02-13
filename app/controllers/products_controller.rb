class ProductsController < ApplicationController
  before_action :set_product, only: %i[show]

  def index
    @sort_type = params[:sort]
    @products = SORTING_TYPE['min'.to_sym]

    if params[:sort]
      @products = SORTING_TYPE[params[:sort].to_sym]
    elsif params[:range_start]
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
