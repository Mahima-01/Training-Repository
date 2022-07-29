class BooksController < ApplicationController
  def index
    @books = Book.all
  end
          
  def new
    @book = Book.new
  end
          
  def create
    @book = Book.new(book_params)
    if @book.save
      CrudNotificationMailer.create_notification(@book).deliver_now
      redirect_to books_path
    else
      render :new
    end
  end
            
      
  def show
    @book  = Book.find(params[:id])
  end
          
  def edit
    @book  = Book.find(params[:id])
  end
   
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to(books_path(@book))
    else
      render('edit')
    end
  end
          
  def destroy
    @book.destroy
    redirect_to books_index_path
  end
          
  private
  def book_params
    params.require(:book).permit(:title, :author_id, :subcategory_id)
  end
          
  def set_book 
    params.require(:book).permit(:title, :author_id, :subcategory_id)
  end
end
