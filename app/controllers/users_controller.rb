class UsersController < ApplicationController
  before_action :load_user, only: :show
  # before_action :correct_user, only: %i(edit update)

  # def new
  #   @user = User.new
  # end

  # def create
  #   @user = User.new user_params
  #   if @user.save
  #     flash[:success] = t ".create_success"
  #     log_in @user
  #     redirect_to @user
  #   else
  #     flash[:danger] = t ".create_fail"
  #     render :new
  #   end
  # end

  # def show; end

  # def edit; end

  # def update
  #   if @user.update user_params
  #     flash[:success] = t ".update_success"
  #     redirect_to @user
  #   else
  #     render :edit
  #   end
  # end

  private

  # def user_params
  #   params.require(:user).permit :name, :email, :password, :password_confirmation, 
  #     :dob, :address, :phone
  # end

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
