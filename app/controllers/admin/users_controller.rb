class Admin::UsersController < ApplicationController
  before_action :admin_user

  def home
    @users = User.all.order(created_at: :desc)
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 6)
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attribute(:admin,true)
      flash[:success] = "Add Admin Users"
      redirect_to admin_users_url
    else
      render 'index'
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.update_attribute(:admin,false)
      flash[:success] = "Removed Admin Users"
      redirect_to admin_users_url
    else
      render 'index'
    end
  end

end
