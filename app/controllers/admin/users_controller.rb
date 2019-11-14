class Admin::UsersController < ApplicationController
  before_action :admin_user

  def home
    @users = User.all.order(created_at: :desc)
  end

  private
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end