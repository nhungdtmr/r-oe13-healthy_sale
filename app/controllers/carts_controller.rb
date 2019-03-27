class CartsController < ApplicationController
  before_action :set_cart, only: :show
  def show
    @order_details = current_order.order_details
  end

  private

  def set_cart
      @cart = Order.find(session[:cart_id])
      rescue ActiveRecord::RecordNotFound
      @cart = Order.create
      session[:cart_id] = @cart.id
  end
end
