class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @activities = Activity.where("user_id IN (?) OR user_id = ?", current_user.following_ids, current_user.id).paginate(page: params[:page], per_page: 5)
      render 'users/home_feeds'
    else
      render 'static_pages/home'
    end

  end

  def about
  end
end
