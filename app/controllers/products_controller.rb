class ProductsController < ApplicationController
  def index
    @sort_type = params[:sort]
    @products = SORTING_TYPE['Low-price'.to_sym]

    if params[:sort]
      @products = SORTING_TYPE[params[:sort].to_sym]
    elsif params[:range_start]
      @products = Product.where('price BETWEEN ? AND ?', params[:range_start], params[:range_end]).order(price: :asc)
    end

    @pagy, @products = pagy(@products, items: 8)
  end
end
