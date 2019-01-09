class UsersController < ApplicationController
  before_action :load_user, only: :show

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t ".create_success"
      sign_up @user
      redirect_to @user
    else
      flash[:danger] = t ".create_fail"
      render :new
    end
  end

  def show; end

  private

  def user_params
    params.require(:user).permit :username, :email, :password, :password_confirmation, 
      :dob, :address, :phone
  end

  def correct_user
    @user = User.find_by id: params[:id]
    flash[:notice] = t ".normal_user"
    redirect_to root_url unless current_user? @user
  end

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t ".no_such"
    redirect_to root_url
  end
end
