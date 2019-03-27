class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order

  include UsersHelper

  include SessionsHelper

  before_action :set_locale
  
  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end

  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end
end
