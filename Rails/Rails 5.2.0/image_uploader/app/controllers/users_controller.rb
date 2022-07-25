class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  def sign_up
    @user = User.new
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "Successfully created user"
    else
      render :sign_up
    end
  end
   

  def searching
    if params[:name]
      @users = User.where('name LIKE ?', "%#{params[:name]}%")
    else
      @users= User.all
    end
    
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      redirect_to root_path
    else
      render :edit
    end
  end

  def user_params
    params.require(:user).permit(:name, :profile, :address, :gender )
  end
end
