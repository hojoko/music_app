class PostsController < ApplicationController
  before_action :authenticate_user
  before_action :ensure_correct_user, only: [:edit, :update]
  
  def index
    @posts = Post.all.order(created_at: :desc)
  end
  
  def show
    @post = Post.find(params[:id])
    @user = User.find_by(id: @post.user_id)
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = @current_user.id
    @post.youtube_url = params[:post][:youtube_url].last(11) 
    if @post.save
      redirect_to "/posts"
    else
      render "new"
    end
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    if @post.save
      redirect_to "/posts"
    else
      render "edit"
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to "/posts"
  end
  
  
  private
    def post_params
      params.require(:post).permit(:text,:user_id)
    end
end
