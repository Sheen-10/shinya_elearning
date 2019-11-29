class CategoriesController < ApplicationController
  def index
    @categories = Category.paginate(page: params[:page], per_page: 6)
    @status = params[:status]
    if @status == "1"
      @categories = current_user.categories.paginate(page: params[:page], per_page: 6)
    elsif @status == "0"
      @categories = @categories.where.not(id: current_user.category_ids).paginate(page: params[:page], per_page: 6)
    end
  end
end
