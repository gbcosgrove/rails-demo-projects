class BooksController < ApplicationController
  def new
    @page_title = 'Add New Book'
    @book = Book.new
    @category = Category.new
    @author = Author.new
    @publisher = Publisher.new
  end

  def create
    @book = Book.create(book_params)
    @book.save

    if @book.save
      flash[:notice] = 'Book Created'
      redirect_to books_path
    else
      render 'new'
    end
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)

    flash[:notice] = 'Book Updated'
    redirect_to books_path
  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    flash[:notice] = 'Book Removed'
    redirect_to books_path
  end

  def index
    @books = Book.all
    @categories = Category.all
  end

  def show
    @book = Book.find(params[:id])
    @categories = Category.all
  end

  private

  def book_params
    params.require(:book).permit(:title, :category_id, :author_id, :publisher_id, :isbn, :price, :cover_path, :excerpt, :buy, :format, :pages, :year)
  end

end
