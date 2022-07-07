class UsersController < ApplicationController
  def index
    @users = User.all.order(:id)
    if params[:search]
      @users = User.where('lower(first_name) LIKE ?', "%#{params[:search].downcase}%").order(:id)
    else
      @users = User.all.order(:id)
    end
  end
    
  def new
    @user = User.new
  end
    
  def create
    @user = User.new(user_params)
    if @user.save
      #CrudNotificationMailer.create_notification(@user).deliver_now
      Sidekiq::Client.enqueue_to_in("default", Time.now + 2.seconds, MailWorker, @user.email, @user.first_name)
      redirect_to users_path
    else
      render :new
    end
  end
      
  def show
    @user = User.find(params[:id])
  end
    
  def search
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
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :gender, :country)
  end

  def set_user
    params.require(:user).permit(:first_name, :last_name, :email, :gender, :country)
    params.require(:user).permit(:first_name, :last_name, :email, :gender, :password, :country, :search)
  end
end 