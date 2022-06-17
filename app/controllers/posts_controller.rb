class PostsController < ApplicationController
  def index
    @user = current_user
  end

  def new
    @post = Post.new
    @user = current_user
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      flash[:notice] = 'New post successfully created'
      redirect_to to { user_posts(current_user)}
    else 
      flas[:alert] = 'Post not added'
      redirect_to to { new_user_post(current_user)}
    end
  end

  def show
    @post = Post.includes(:comments).find(params[:id])
  end

  private

  def post_params
    a_post = params.require(:post).permit(:title, :text)
    a_post[:author] = current_user
    a_post
  end

  def post_params_set
    Post.create(author: current_user, title: params[:post][:title], text: params[:post][:text])
  end
end
