class AuthorsController < ApplicationController

  def index
    @authors = Author.all
  end
                
  def new
    @author = Author.new
  end
                
  def create
    @author = Author.new(author_params)
    if @author.save
      CrudNotificationMailer.create_notification(@author).deliver_now
      redirect_to authors_path
    else
      render :new
    end
  end
                         
  def show
    @author  = Author.find(params[:id])
  end
                
  def edit
    @author  = Author.find(params[:id])
  end
                
  def update
    @author  = Author.find(params[:id])
    if @auhtor.update(author_params)
      redirect_to root_path
    else
      render :edit
    end
  end
                
  def destroy
    @auhtor = Author.find(params[:id])
    @auhtor.destroy
    redirect_to authors_path
  end
                
  private
  def author_params
    params.require(:auhtor).permit(:name, :email, :gender)
  end
                
  def set_author 
    params.require(:author).permit(:name, :email, :gender)
  end
      
end
