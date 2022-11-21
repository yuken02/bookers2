class UsersController < ApplicationController

  def index
    @book = Book.new
    # @user_info = User.find(current_user.id)
    @user = User.find(current_user.id)
    @users = User.all
  end

  def show
    @book = Book.new
    # @user_info = User.find(params[:id])
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    is_matching_login_user
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

  def is_matching_login_user
    user_id = params[:id].to_i
    login_user_id = current_user.id
    if (user_id != login_user_id)
      redirect_to user_path(current_user)
    end
  end

end
