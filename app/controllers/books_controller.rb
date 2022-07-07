class BooksController < ApplicationController
  def new

  end

  def create

  @book = Book.new(book_params)
    if  @book.save
      flash[:notice] = "Book was successfuly created"
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index

    end
  end


  def index
    @books = Book.all
    @book = Book.new

  end

  def show
    @book = Book.find(params[:id])

  end

  def edit
    @book = Book.find(params[:id])
  end


  def update
  @book= Book.find(params[:id])
  if @book.update(book_params)
    redirect_to book_path(@book.id)
    flash[:notice] = "Book was successfuly created"
  else
    render :edit
  end

  end

  def destroy
    book = Book.find(params[:id])
  if  book.destroy
    flash[:notice] = "Book was successfuly destroyed"
  else
    render :index
  end
    redirect_to '/books/index'
  end


  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
