require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it 'should return the correct response' do
      get '/users/users/posts'
      expect(response).to have_http_status(200)
      expect(response.body).to include('Posts')
      expect(response.body).to include('Display posts')
    end
  end

  describe 'GET /show' do
    it 'should return the correct reponse' do
      get '/users/user/posts/post'
      expect(response).to have_http_status(200)
      expect(response.body).to include('Posts')
      expect(response.body).to include('Display post details')
    end
  end
end
