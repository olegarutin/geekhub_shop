class CategoriesController < ApplicationController
  before_action :set_category

  def show
    @sort_type = params[:sort]
    @products = SORTING_TYPE['Low-price'.to_sym].where(category_id: @category)

    if @sort_type
      @products = SORTING_TYPE[params[:sort].to_sym].where(category_id: @category)
    elsif params[:category]
      @products = @products.where('price BETWEEN ? AND ?', params[:category][:range_start], params[:category][:range_end]).order(price: :asc)
    end

    @pagy, @products = pagy(@products, items: 8)
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end
end
