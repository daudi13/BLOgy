require 'rails_helper'

RSpec.describe Like, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  before(:all) do
    @user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    @post = Post.create(title: 'Hello', author:@user)
  end

  it 'should return like_counter increments after a post is liked' do
    expect(@post.likes_counter).to be 0

    like = Like.new(author: @user, post: @post)
    like.save
    expect(@post.likes_counter).to be 1
  end
end
