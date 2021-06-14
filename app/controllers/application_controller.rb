class ApplicationController < ActionController::Base
  before_action :current_user

  def current_user
    @current_user = User.find_by(id: session[:id])
  end
  
  def authenticate_user
    if @current_user == nil
      redirect_to '/login'
    end
  end
  
  def forbid_login_user
    if @current_user
      redirect_to "/posts"
    end
  end

  
  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      redirect_to "/posts"
    end
  end
    
    
  
end
