class BooksController < ApplicationController
   before_action :authenticate_user!
  def index
    @books = Book.all
    @user = current_user
    @book = current_user
  end

  def show
    @book = Book.find(params[:id])
  end

   def create
    @book = Book.new(book_params)
    @book.user = current_user
    if @book.save
    flash[:success] = 'You have created book successfully.'
    redirect_to book_path(@book)
    else
    @user = current_user
    @books = Book.all
    render :index
    end
   end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
      render:edit
    else
      redirect_to books_path
    end
  end

  def update
      @book = Book.find(params[:id])
      @book.update(book_params)
    if @book.save
      flash[:success] = 'You have updated book successfully.'
     redirect_to book_path(@book)
    else
     @books = Book.all
     render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end
end