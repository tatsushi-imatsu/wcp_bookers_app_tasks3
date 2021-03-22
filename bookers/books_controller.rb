class BooksController < ApplicationController
  def new
  end

  def index
    @book = Book.find(params[:id])
  end  
    
  def show
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:success] = 'Book was successfully created.'
     redirect_to book_path(@book)
    else
     @books = Book.all
     render :show
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
      @book = Book.find(params[:id])
      @book.update(book_params)
    if @book.save
      flash[:success] = 'Book was successfully updated.'
     redirect_to book_path(@book)
    else
     @books = Book.find(params[:id])
     render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to book_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end