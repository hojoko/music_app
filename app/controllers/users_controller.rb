class UsersController < ApplicationController
  before_action :authenticate_user, only: [:index,:show,:edit]
  before_action :ensure_correct_user, only: [:edit, :update]
  
  def index
    @users = User.all.order(created_at: :desc)
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to "/users"
    else
      render "new"
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
      redirect_to "/users"
    else
      render :edit
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to "/users"
  end
  
  def login_form
  end
  
  def login
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user
      session[:id] = @user.id
      redirect_to "/posts"
    else
      @email = params[:email]
      @password = params[:password]
      render "login_form"
    end
  end
  
  def logout
    session[:id] = nil
    redirect_to "/login"
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
  
end
