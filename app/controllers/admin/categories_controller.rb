class Admin::CategoriesController < ApplicationController
  before_action :admin_user

  def index
    @categories = Category.paginate(page: params[:page], per_page: 6)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Created New Category"
      redirect_to admin_categories_url
    else
      render "new"
    end
  end


  private
    def category_params
      params.require(:category).permit(:title, :description)
    end

end
