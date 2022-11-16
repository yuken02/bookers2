class BooksController < ApplicationController
  def new
  end

  def index
    @books = Book.all
    @user = User.find(current_user.id)
  end

  def show
    @books = Book.all
    @user = User.find(params[:id])
  end

  def edit
  end


  private

  def user_params
    params.require(:user).permit(:name, :introduction)
  end
end
