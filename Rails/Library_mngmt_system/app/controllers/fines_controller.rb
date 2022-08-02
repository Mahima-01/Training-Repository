class FinesController < ApplicationController
  FINES_PER_PAGE = 2

  def index
    @page = params.fetch(:page, 0).to_i
    if params[:search]
      @fines = Fine.where('lower(payment_status) LIKE ?', "%#{params[:search].downcase}%").order(:id).offset(@page * FINES_PER_PAGE).limit(FINES_PER_PAGE)
    else
      @fines_count = Fine.all.count
      @fines = Fine.all.order(:id).offset(@page * FINES_PER_PAGE).limit(FINES_PER_PAGE)
    end
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
