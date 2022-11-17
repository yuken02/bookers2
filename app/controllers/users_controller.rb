class UsersController < ApplicationController

  def new
  end

  def index
    @user_info = User.find(current_user.id)
    @users = User.all
  end

  def show
    @user_info = User.find(current_user.id)
    @books = Book.where(params[:user_id])
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end


  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
