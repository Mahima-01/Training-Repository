class IssueReturnsController < ApplicationController
  def index
    @issue_returns = IssueReturn.all
  end
          
  def new
    @issue_returns = IssueReturn.new
  end
          
  def create
    @issue_returns = IssueReturn.new(issue_returns_params)
    if @Issue_returns.save
      redirect_to issue_returns_path
    else
      render :new
    end
  end
            
  def show
    @issue_returns =IssueReturn.find(params[:id])
  end
          
  def edit
    @issue_returns = IssueReturn.find(params[:id])
  end
          
  def update
    @issue_returns = IssueReturn.find(params[:id])
    if @issue_returns.update(issue_returns_params)
      redirect_to(issue_returns_path(@issue_returns))
    else
      render('edit')
    end
  end
          
  def destroy
    @issue_returns.destroy
    redirect_to issue_returns_path
  end
          
  private
  def issue_returns_params
    params.require(:issue_returns).permit(:book_id, :student_id, :issue_time, :return_time)
  end
          
  def set_issue_returns
    params.require(:issue_returns).permit(:book_id, student_id, issue_time, :return_time)
  end
       
end
