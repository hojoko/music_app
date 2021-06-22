class UsersController < ApplicationController
  before_action :authenticate_user, only: [:index,:show,:edit]
  before_action :ensure_correct_user, only: [:edit, :update]
  before_action :forbid_login_user, only: [:login_form, :new]
  
  def index
    @users = User.all.order(created_at: :desc)
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:id] = @user.id
      redirect_to posts_path
    else
      flash.now[:alert] = "Name,Email,Passwordのいずれかが正しくありません"
      render 'new'
    end
  end
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc).page(params[:page]).per(10)
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path
    else
      flash.now[:alert] = "Name,Emailのいずれかが正しくありません"
      render :edit
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end
  
  def login_form
  end
  
  def login
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user
      session[:id] = @user.id
      redirect_to posts_path
    else
      @email = params[:email]
      @password = params[:password]
      flash.now[:alert] = "Email,Passwordのいずれかが正しくありません"
      render "login_form"
    end
  end
  
  def logout
    session[:id] = nil
    redirect_to login_path
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
  
end
