class ProductsController < ApplicationController
  before_action :load_product, only: :show
  before_action :load_category, only: :index
  
  def index
    @products = Product.search_by_name(params[:product_name]).page(params[:page]).per Settings.value.product_page
    @order_detail = current_order.order_details.new
    if params[:category]
      @products = Product.search_products_by_category(params[:category]).page(params[:page]).per Settings.value.product_page
    end
    respond_to do |format|
      format.html
      format.js {render :index}
    end     
  end

  def show; end

  private
  
  def load_product
    @product = Product.find_by id: params[:id]
    return if @product
  end

  def load_category
    @categories = Category.select_categories
  end
end
