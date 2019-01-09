class Admin::UsersController < Admin::BaseController
  before_action :load_user, only: :destroy

  def index
    @users = User.select_users.order_by.page(params[:page]).per Settings.value.user_page
  end

  def destroy
    if user.is_admin?
      flash[:danger] = t ".no_delete"
    elsif user.destroy
      flash[:success] = t ".user_delete"
    else
      flash[:error] = t ".no_delete"
    end
  end

  private

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t ".user"
    redirect_to admin_users_path
  end
end
