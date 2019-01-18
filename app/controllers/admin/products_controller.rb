class Admin::ProductsController < Admin::BaseController
  before_action :load_product, only: %i(edit update destroy)
  before_action :load_category, :load_supplier, only: %i(new create edit destroy)

  def index
    @products = Product.order_by.search_by_name(params[:product_name]).page(params[:page]).per Settings.value.admin_page
  end

  def new
    @product = Product.new
    @images = @product.images.build
  end

  def create
    @product = Product.new product_params
    @product.supplier_ids = params[:product][:supplier_ids]
    if @product.save
      params[:images]["url"].each do |img|
        @image = @product.images.create!(url: img)
      end
      flash[:success] = t ".add_success"
      redirect_to admin_products_path
    else
      flash[:danger] = t ".add_fail"
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update product_params
      params[:images]["url"].each do |img|
        @image = @product.images.create!(url: img)
      end
      flash["success"] = t ".update_success"
      redirect_to admin_products_path
    else
      flash[:danger] = t ".update_fail"
      render :edit
    end
  end

  def destroy
    if @product.destroy
      flash[:success] = t ".delete_success"
    else
      flash[:danger] = t ".deleted_fail"
    end
    respond_to do |format|
      format.js
      format.html {redirect_to admin_products_path}
      format.json 
    end
  end
  
  private

  def product_params
    params.require(:product).permit :name, :manufacture, :net_weight, :price, :description, :category_id, 
      supplier_ids: [], images_attributes: [:id, :product_id, :url]
  end

  def load_product
    @product = Product.find_by id: params[:id]
    return if @product
    flash[:danger] = t ".no_product"
    redirect_to admin_products_path
  end

  def load_category
    @category = Category.select_categories
  end

  def load_supplier
    @suppliers = Supplier.select_suppliers
  end

end
