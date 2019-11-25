class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @categories = Category.paginate(page: params[:page], per_page: 6)
  end
end
