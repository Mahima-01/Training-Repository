class BooksController < ApplicationController
  def index
    @books = Book.all
  end
          
  def new
    @book = Book.new
  end
          
  def create
    @book = book .new(book_params)
    if @book .save
      CrudNotificationMailer.create_notification(@book).deliver_now
      redirect_to books_path
    else
      render :new
    end
  end
            
      
  def show
    @book  = book .find(params[:id])
  end
          
  def edit
    @book  = book .find(params[:id])
  end
          
  def update
    @book  = book .find(params[:id])
    if @book .update(book _params)
      redirect_to books_path(@book)
    else
      render :edit
    end
  end
          
  def destroy
    @book .destroy
    redirect_to books_index_path
  end
          
  private
  def book _params
    params.require(:book ).permit(:title, :language, :author_id, :subcategory_id)
  end
          
  def set_book 
    params.require(:book).permit(:title, :language, :author_id, :subcategory_id)
  end
end
