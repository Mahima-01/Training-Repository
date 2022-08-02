class BooksController < ApplicationController
  BOOKS_PER_PAGE = 3

  def index
    @book = Book.all.paginate(page: params[:page], per_page: 3)
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
    @book = ook.find(params[:id])
    if @book.destroy
      redirect_to(books_path)
    end
  end
          
  private
  def book_params
    params.require(:book).permit(:id, :title, :author_id)
  end
          
  def set_book 
    params.require(:book).permit(:id, :title, :author_id)
  end
end
