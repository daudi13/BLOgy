require 'rails_helper'

RSpec.describe 'user_index_path', type: :system do
  describe 'User_index_view' do
    before(:each) do
      @users = [User.create!(name: 'David', photo: '#photo_david', bio: 'bio', email: 'david@test.com', password: '123456', posts_counter: 0),
                User.create!(name: 'Zahra', photo: '#photo_zahra', bio: 'bio', email: 'zahra@test.com',
                             password: 'zahra123', posts_counter: 10),
                User.create!(name: 'Mark', bio: 'bio', email: 'mark@test.com', password: 'password', posts_counter: 20)]

      visit new_user_session_path

      fill_in 'user_email',	with: 'zahra@test.com'
      fill_in 'user_password',	with: 'password'
      click_button 'Log in'
    end

    after(:each) do
      User.destroy_all
    end

    it 'I can see the username of all other users.' do
      visit users_path

      @users.each do |u|
        expect(page).to have_content u.name
      end
    end

    it 'I can see the user"s profile picture' do
      expect(page.find("#user_#{@user.id} img")['src']).to have_content @user.photo
    end

    it 'I can see the number of posts each user has written.' do
      visit users_path

      @users.each do |u|
        expect(page).to have_content('Number of posts:')

        expect(page).to have_content u.posts_counter
      end
    end

    it 'When I click on a user, I am redirected to that user s show page.' do
      visit users_path
      click_link @users[0].name
      expect(page).to have_content 'See All Posts'
    end
  end
end
