class ProductCategoriesController < ApplicationController
  before_action :set_category

  def show
    @sort_type = params[:sort] || 'min'

    if @subcategory
      @products = SORTING_TYPE[@sort_type.to_sym].where(subcategory_id: @subcategory)
    else
      @products = SORTING_TYPE[@sort_type.to_sym].where(category_id: @category)
    end

    if params[:range_start]
      @products = @products.where('price BETWEEN ? AND ?', params[:range_start], params[:range_end]).order(price: :asc)
    elsif params[:search]
      @products = @products_all.where('title ILIKE ?', "%#{params[:search]}%")
    end

    @pagy, @products = pagy(@products, items: 8)
  end

  private

  def set_category
    @category = Category.find(params[:id])
    @subcategory = Subcategory.find(params[:subcategory_id]).id if params[:subcategory_id]
  end
end
