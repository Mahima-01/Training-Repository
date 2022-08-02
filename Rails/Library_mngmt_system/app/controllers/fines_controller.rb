class FinesController < ApplicationController
  def index
    @fines = Fine.all
  end
            
  def new
    @fine = Fine.new
  end
            
  def create
    @fine = Fine.new(fine_params)
    if @fine.save
      redirect_to fines_path
    else
      render :new
    end
  end
              
  def show
    @fine = Fine.find(params[:id])
  end
            
  def edit
    @fine = Fine.find(params[:id])
  end
            
  def update
    @fine = Fine.find(params[:id])
    if @fine.update(fine_params)
      redirect_to(fines_path(@fine))
    else
      render('edit')
    end
  end
            
  def destroy
    @fines = Fine.find(params[:id])
    if @fines.destroy
    redirect_to(fines_path)
    end
  end          
  private
  def fine_params
    params.require(:fine).permit(:issue_returns_id, :student_id, :amount, :payment_status)
  end
            
  def set_fine
    params.require(:fine).permit(:issue_returns_id, :amount, :payment_status)
  end
             
end
