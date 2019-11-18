class Admin::CategoriesController < ApplicationController
  before_action :admin_user

  def index
    @categories = Category.paginate(page: params[:page], per_page: 8)
  end
end