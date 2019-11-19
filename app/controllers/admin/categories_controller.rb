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

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      flash[:success] = "Category Successfully Updated"
      redirect_to admin_categories_url
    else
      render 'new'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      flash[:success] = "Removed Category"
      redirect_to admin_categories_url
    else
      render 'new'
    end
  end


  private
    def category_params
      params.require(:category).permit(:title, :description)
    end

end
