class ProductCategoriesController < ApplicationController
  before_action :set_category

  def show
    @sort_type = params[:sort] || 'min'
    query = @subcategory ? { subcategory_id: @subcategory } : { category_id: @category }
    @products = Product.order(SORTING_TYPE[@sort_type.to_sym]).where(query)

    if params[:range_start]
      @products = @products.where('price BETWEEN ? AND ?', params[:range_start], params[:range_end]).order(price: :asc)
    elsif params[:search]
      @products = @products.where('title ILIKE ?', "%#{params[:search]}%")
    end

    @pagy, @products = pagy(@products, items: 8)
  end

  private

  def set_category
    @category = Category.find(params[:id])
    @subcategory = Subcategory.find(params[:subcategory_id]).id if params[:subcategory_id]
  end
end
