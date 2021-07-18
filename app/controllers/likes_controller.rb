class LikesController < ApplicationController
  before_action :post_params
  
  def create
    like = Like.new(post_id: params[:post_id], user_id: @current_user.id)
    like.save
  end
  
  def destroy
    like = Like.find_by(post_id: params[:post_id], user_id: @current_user.id)
    like.destroy
  end
  
  private
    def post_params
      @post = Post.find(params[:post_id])
    end
  
end
