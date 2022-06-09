require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'should return the correct response' do
      get '/users'
      expect(response).to have_http_status(200)
      expect(response.body).to include('List all users')
      expect(response.body).to include('users')
    end
  end
end