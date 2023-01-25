class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user[:id]
    @book.save
    flash[:notice] = "You have created book successfully."
    redirect_to book_path(@book.id)
  end

  def index
    @user = current_user
    @books = Book.all
  end

  def show
    @books = Book.find(params[:id])
    @book = Book.new
    @user = current_user
  end

  def edit
    @book = Book.find(params[:id])
    @book = Book.all
    @user = current_user
  end

  def update
    book = Book.faind(params[:id])
    book.update(book_params)
    flash[:notice] = "You have updated book successfully."
    redirect_to book_path(book.id)
  end

  def destroy
    @book = Book.find
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end



end
