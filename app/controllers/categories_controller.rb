class CategoriesController < ApplicationController
  before_action :set_category

  def show
    @sort_type = params[:sort]
    @products_all = SORTING_TYPE['min'.to_sym]
    @products = @products_all.where(category_id: @category)
    @range = params[:category]

    if @sort_type
      @products = SORTING_TYPE[params[:sort].to_sym].where(category_id: @category)
    elsif @range
      @products = @products.where('price BETWEEN ? AND ?', @range[:range_start], @range[:range_end]).order(price: :asc)
    elsif params[:search]
      @products = @products_all.where('title ILIKE ?', "%#{params[:search]}%")
    end

    @pagy, @products = pagy(@products, items: 8)
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end
end
