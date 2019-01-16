class ProductsController < ApplicationController
  def index
    @products = Product.order_by.search(params[:search]).page(params[:search]).per Settings.value.product_page
  end

  def show
  end
end
