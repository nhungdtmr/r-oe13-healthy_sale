class ProductsController < ApplicationController
  def index
    @products = Product.order_by.search(params[:search]).page(params[:search]).per Settings.value.product_page
  end

  def show
    @product = Product.find_by id: params[:id]
    return if @product
  end
end
