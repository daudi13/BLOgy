class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    post = Post.find(params[:post_id])
    @like = Like.new(author: current_user, post: post)

    if @like.save
      flash[:notice] = 'you liked this post'
      redirect_to user_post_likes_path(current_user, post)
    else
      flash[:alert] = 'Can not like'
      redirect_to {new_user_post(current_user)}
    end
  end
end
