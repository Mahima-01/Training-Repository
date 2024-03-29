class StudentsController < ApplicationController 
  def index
    if params[:search]
      @student = Student.where('lower(name) LIKE ?', "%#{params[:search].downcase}%").paginate(page: params[:page], per_page: 3)
      @student = Student.where('lower(address) LIKE ?', "%#{params[:search].downcase}%").paginate(page: params[:page], per_page: 3)
    else
      @student = Student.all.paginate(page: params[:page], per_page: 3)
    end
  end
      
  def new
    @student = Student.new
  end
      
  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to students_path
    else
      render :new
    end
  end
        
  def show
    @student = Student.find(params[:id])
  end
      
  def edit
    @student = Student.find(params[:id])
  end
      
  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
      redirect_to(students_path(@student))
    else
      render('edit')
    end
  end
      
  def destroy
    @student = Student.find(params[:id])
    if @student.destroy
      redirect_to(student_index_path)
    end
  end
      
  private
  def student_params
    params.require(:student).permit(:name, :id, :address, :phone_no, :email)
  end
      
  def set_student
    params.require(:student).permit(:name, :id, :address, :phone_no, :email)
  end
   
end
