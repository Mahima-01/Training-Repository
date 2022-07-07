class UsersController < ApplicationController
  def index
    @users = User.all
  end
    
  def new
    @user = User.new
  end
    
  def create
    @user = User.new(User_params)
    if @user.save
      CrudNotificationMailer.create_notification(@user).deliver_now
      redirect_to users_path
    else
      render :new
    end
  end
      
  def show
    @user = User.find(params[:id])
  end
    
  def edit
    @user = User.find(params[:id])
  end
    
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path(@user)
    else
      render :edit
    end
  end
    
  def destroy
    @user.destroy
    redirect_to users_in
  end
end 