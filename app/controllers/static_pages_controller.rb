class StaticPagesController < ApplicationController
  def home
    if logged_in?
      render 'users/home_feeds'
    else
      render 'static_pages/home'
    end

  end

  def about
  end
end
