class StudentsController < ApplicationController
  STUDENTS_PER_PAGE = 3
  def index
    @page = params.fetch(:page, 0).to_i
    if params[:search]
      @students_count = Student.where('lower(name) LIKE ?', "%#{params[:search].downcase}%").count
      @students = Student.where('lower(name) LIKE ?', "%#{params[:search].downcase}%").order(:id).offset(@page * STUDENTS_PER_PAGE).limit(STUDENTS_PER_PAGE)
    else
      @students_count = Student.all.count
      @students = Student.all.order(:id).offset(@page * STUDENTS_PER_PAGE).limit(STUDENTS_PER_PAGE)
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
