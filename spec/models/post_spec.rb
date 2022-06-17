require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:all) do
    @user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    @post = Post.create(title: 'Hello', author:@user) 
  end

  it 'should return comments_counter greater than or equal to 0' do
    @post.comments_counter = -15
    expect(@post).to_not be_valid

    @post.comments_counter = 0
    expect(@post).to be_valid

    @post.comments_counter = 16
    expect(@post).to be_valid
  end

  it 'should have likes_counter numericaly' do
    @post.likes_counter = 'one'
    expect(@post).to_not be_valid

    @post.likes_counter = 20
    expect(@post).to be_valid
  end

  it 'should not have an empty title' do
    @post.title = 'My first post'
    expect(@post).to be_valid

    @post.title = ''
    expect(@post).to_not be_valid
  end
end
