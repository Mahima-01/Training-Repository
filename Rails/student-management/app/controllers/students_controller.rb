class StudentsController < ApplicationController

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      CrudNotificationMailer.create_notification(@student).deliver_now
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
      redirect_to students_path(@student)
    else
      render :edit
    end
  end

  def destroy
    @student.destroy
    redirect_to students_index_path
  end

  private
  def student_params
    params.require(:student).permit(:first_name, :last_name, :email)
  end

  def set_student
    params.require(:student).permit(:first_name, :last_name, :email)
  end
end
