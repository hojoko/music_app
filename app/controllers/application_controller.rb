class ApplicationController < ActionController::Base
  before_action :current_user

  def current_user
    @current_user = User.find_by(id: session[:id])
  end
  
  def authenticate_user
    if @current_user == nil
      flash[:alert] = "ログインが必要です"
      redirect_to '/login'
    end
  end
  
  def forbid_login_user
    if @current_user
      flash[:notice] = "ログインしています"
      redirect_to "/posts"
    end
  end

  
  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      flash[:alert] = "権限がありません"
      redirect_to "/posts"
    end
  end
    
    
  
end
