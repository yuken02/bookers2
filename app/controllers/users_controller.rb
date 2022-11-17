class UsersController < ApplicationController

  def new
  end

  def show
    @user_info = User.find(current_user.id)
  end

  def edit
  end


  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
