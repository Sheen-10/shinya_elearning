class UsersController < ApplicationController

  def index
    @users = User.paginate(page: params[:page], per_page: 8)
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @activities = @user.activities.paginate(page: params[:page], per_page: 5)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Awesome Idioms"
      redirect_to root_url
    else
      render "new"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to root_url
    else
      render 'new'
    end
  end



  # string parameter

  private
    def user_params
      params.require(:user).permit(:name, :email, :password,
      :password_confirmation, :avatar)
    end

end
