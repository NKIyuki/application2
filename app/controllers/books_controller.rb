class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(current_user)
  end

  def index
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @user = current_user
  end

  def edit
  end
end
