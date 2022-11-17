class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id)
    else
      render :new
    end

  end

  def index
    @books = Book.all
    @user_info = User.find(current_user.id)
    @users = User.all
  end

  def show
    @book = Book.find(params[:id])
    @user_info = User.find(current_user.id)
  end

  def edit
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to '/books'
  end


  private

  def book_params
    params.permit(:title, :body, :user_id)
  end

  def user_params
    params.require(:user).permit(:name, :introduction)
  end
end
