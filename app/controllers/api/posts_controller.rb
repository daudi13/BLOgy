class Api::PostsController < ApplicationController
  before_action :authorize_request

  def index
    @posts = Post.all

    if @posts.empty?
      json_response({ message: 'Posts not found' }, 404)
    else
      render json: @posts, status: :ok
    end
  end
end
