class ApplicationController < ActionController::Base
  include Pagy::Backend

  SORTING_TYPE = { 'Low-price': Product.order(price: :asc),
                   'High-price': Product.order(price: :desc),
                   'From A to Z': Product.order(title: :asc),
                   'From Z to A': Product.order(title: :desc) }.freeze
end
