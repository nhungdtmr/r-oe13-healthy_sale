class Admin::ProductsController < Admin::BaseController
  before_action :load_product, only: :index
  before_action :load_category, :load_supplier, only: %i(new create)

  def index; end

  def new
    @product = Product.new
    @images = @product.images.build
  end

  def create
    @product = Product.new product_params
    @product.supplier_ids = params[:product][:supplier_ids]
    if insert_image_data
      flash[:success] = t ".add_success"
      redirect_to admin_products_path
    else
      flash[:danger] = t ".add_fail"
      render :new
    end
  end

  def insert_image_data
    ActiveRecord::Base.transaction do
      @product.save
      params[:images]["url"].each do |img|
        @image = Image.create product_id: @product.id, url: img
        @image.save
      end
    end
  end
  
  private

  def product_params
    params.require(:product).permit :name, :manufacture, :net_weight, :price, :description, :category_id, 
      supplier_ids: [], images_attributes: [:id, :product_id, :url]
  end

  def load_product
    @products = Product.select_products.order_by.page(params[:page]).per Settings.value.product_page
  end

  def load_category
    @category = Category.select_categories
  end

  def load_supplier
    @suppliers = Supplier.select_suppliers
  end
end
