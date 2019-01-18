class ProductsController < ApplicationController
  before_action :load_product, only: :show
  before_action :load_category, only: :index
  
  def index
    @products = Product.order_by.search_products_by_category(params[:category])
      .page(params[:page]).per Settings.value.product_page
    @search = Product.ransack(params[:q])
    @products = @search.result.includes(:category).page(params[:page]).per Settings.value.product_page
    if params[:product_name]
      @products = Product.search_by_name(params[:product_name]).page(params[:page]). per Settings.value.product_page
      respond_to do |format|
        format.html
        format.js {render :index}
      end    	
    end
  end

  def show; end

  def load_product
  	@product = Product.find_by id: params[:id]
  	return if @product
  end

  def load_category
    @categories = Category.select_categories
  end
end
