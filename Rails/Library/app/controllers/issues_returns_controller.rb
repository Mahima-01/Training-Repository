class IssuesReturnsController < ApplicationController
  before_action :set_issues_return, only: %i[ show edit update destroy ]

  # GET /issues_returns or /issues_returns.json
  def index
    @issues_returns = IssuesReturn.all
  end

  # GET /issues_returns/1 or /issues_returns/1.json
  def show
  end

  # GET /issues_returns/new
  def new
    @issues_return = IssuesReturn.new
  end

  # GET /issues_returns/1/edit
  def edit
  end

  # POST /issues_returns or /issues_returns.json
  def create
    @issues_return = IssuesReturn.new(issues_return_params)

    respond_to do |format|
      if @issues_return.save
        format.html { redirect_to issues_return_url(@issues_return), notice: "Issues return was successfully created." }
        format.json { render :show, status: :created, location: @issues_return }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @issues_return.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /issues_returns/1 or /issues_returns/1.json
  def update
    respond_to do |format|
      if @issues_return.update(issues_return_params)
        format.html { redirect_to issues_return_url(@issues_return), notice: "Issues return was successfully updated." }
        format.json { render :show, status: :ok, location: @issues_return }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @issues_return.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issues_returns/1 or /issues_returns/1.json
  def destroy
    @issues_return.destroy

    respond_to do |format|
      format.html { redirect_to issues_returns_url, notice: "Issues return was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issues_return
      @issues_return = IssuesReturn.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def issues_return_params
      params.require(:issues_return).permit(:student_id, :book_id, :issue_date, :return_date)
    end
end
