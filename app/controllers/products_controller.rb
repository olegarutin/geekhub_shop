class ProductsController < ApplicationController
  before_action :set_product, only: %i[show]
  def index
    @sort_type = params[:sort]
    @products = SORTING_TYPE['Low-price'.to_sym]

    if params[:sort]
      @products = SORTING_TYPE[params[:sort].to_sym]
    elsif params[:range_start]
      @products = Product.where('price BETWEEN ? AND ?', params[:range_start], params[:range_end]).order(price: :asc)
    elsif params[:search]
      @products = Product.where("title ILIKE ?", "%#{params[:search]}%")
    end

    @pagy, @products = pagy(@products, items: 8)
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end
end
