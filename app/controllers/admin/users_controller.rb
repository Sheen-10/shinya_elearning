class Admin::UsersController < ApplicationController
  before_action :admin_user

  def home
    @users = User.all.order(created_at: :desc)
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 8)
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attribute(:admin,true)
      flash[:success] = "Add Administer Users"
      redirect_to admin_users_url
    else
      render 'index'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "Destroyed Administer Users"
    redirect_to admin_users_url
  end

  private
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
