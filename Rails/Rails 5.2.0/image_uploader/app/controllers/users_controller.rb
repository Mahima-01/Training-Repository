class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def sign_up
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "Successfully created user"
    else
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:name, :profile, :address, :gender )
  end
end
