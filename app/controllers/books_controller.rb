class BooksController < ApplicationController
  def top
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
    redirect_to "/books/#{@book.id}", notice: 'Book was successfully created.'
    else
    @books = Book.all
    render action: :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    redirect_to @book, notice: 'Book was successfully updated.'
    else
    render  action: :edit
    end
  end

   def destroy
    book = Book.find(params[:id])
    book.destroy
      if book.destroy
      end
    redirect_to ('/books'), notice: 'Book was successfully destroyed.'
   end

  private

    def book_params
        params.require(:book).permit(:title, :body)
    end
end