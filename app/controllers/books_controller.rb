class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      @user_info = User.find(current_user.id)
      render :index
    end
  end

  def index
    @book = Book.new
    @books = Book.all
    @user_info = User.find(current_user.id)
  end

  def show
    @book = Book.new
    @book_show = Book.find(params[:id])
    @user_info = User.find(current_user.id)
  end

  def edit
    @book = Book.find(params[:id])
    is_matching_login_user
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_update_params)
      flash[:notice] = "You have updated book successfully"
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to '/books'
  end


  private

  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

  def book_update_params
    params.require(:book).permit(:title, :body)
  end

  def user_params
    params.require(:user).permit(:name, :introduction)
  end

  def is_matching_login_user
    login_user_id = current_user.id
    if (@book.user_id != login_user_id)
      redirect_to books_path
    end
  end
end
