class PostsController < ApplicationController
  before_action :authenticate_user
  before_action :ensure_correct_user_post, only: [:edit, :update]
  
  def index
    @posts = Post.all.order(created_at: :desc).page(params[:page]).per(10)
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
      flash[:notice] = "投稿しました"
      redirect_to posts_path
    else
      flash.now[:alert] = "URLとコメントを正しく入力してください"
      render new_post_path
    end
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    if @post.save
      flash[:notice] = "投稿を編集しました"
      redirect_to posts_path
    else
      flash.now[:alert] = "URLとコメントを正しく入力してください"
      render edit_post_path
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:alert] = "投稿を削除しました"
    redirect_to posts_path
  end
  
  def ensure_correct_user_post
    @post = Post.find(params[:id])
    if @current_user.id != @post.user_id
      flash[:alert] = "権限がありません"
      redirect_to posts_path
    end
  end
    
  
  
  private
    def post_params
      params.require(:post).permit(:text,:user_id)
    end
end
