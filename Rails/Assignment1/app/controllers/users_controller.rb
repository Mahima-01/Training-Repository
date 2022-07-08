require 'json'
require 'rest_client'
require 'open-uri'

class UsersController < ApplicationController
  USERS_PER_PAGE = 3
  
  def index
    @page = params.fetch(:page, 0).to_i
    if params[:search]
      @users_count = User.where('lower(first_name) LIKE ?', "%#{params[:search].downcase}%").count
      @users = User.where('lower(first_name) LIKE ?', "%#{params[:search].downcase}%").order(:id).offset(@page * USERS_PER_PAGE).limit(USERS_PER_PAGE)
    else
      @users_count = User.all.count
      @users = User.all.order(:id).offset(@page * USERS_PER_PAGE).limit(USERS_PER_PAGE)
    end
  end
    
  def new
    @user = User.new
  end
    
  def create
    @user = User.new(user_params)
    if @user.save
      #CrudNotificationMailer.create_notification(@user).deliver_now
      #Sidekiq::Client.enqueue_to_in("default", Time.now + 2.seconds, MailWorker, @user.email, @user.first_name)
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
  
  def api
    url = "https://reqres.in/api/users?page=1"
    response = RestClient.get(url)
    data_h = JSON.parse(response)
    print data_h.keys
    data_h['data'].each do |user|
      @email = user['email']
      @first_name = user['first_name']
      @last_name = user['last_name']
      @gender = user['gender']
      @user = User.new(email: @email, first_name: @first_name, last_name: @last_name, gender: @gender)
      if @user.save
        Sidekiq::Client.enqueue_to_in("default", Time.now, MailWorker, @user.email, @user.first_name)
      else
        notice "Details incorrect"
        render :new
      end
    end
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
    params.require(:user).permit(:first_name, :last_name, :email, :gender, :country, hobbies: [])
  end

  def set_user
    params.require(:user).permit(:first_name, :last_name, :email, :gender, :country, :hobbies)
    params.require(:user).permit(:first_name, :last_name, :email, :gender, :password, :country, :search, :hobbies)
  end
end 