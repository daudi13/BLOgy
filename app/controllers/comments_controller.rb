class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @user = current_user
  end

  def create
    post = Post.find(params[:post_id])
    @comment = Comment.new(post_params(post))

    if @comment.save
      flash[:notice] = 'Comment successfully created'
      redirect_to user_post_path(current_user, post)
    else 
      flash[:alert] = 'Cannot add a comment'
      redirect_to { new_user_post(current_user) }
    end
  end

  private

  def post_params(post)
    a_post = params.require(:comment).permit(:text)
    a_post[:author] = current_user
    a_post[:post] = post
    a_post
  end
end
