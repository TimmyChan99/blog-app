require 'rails_helper'

RSpec.describe 'Blog app', type: :feature do
  describe ' user index show page' do
    before(:each) do
      @user1 = User.create!(name: 'User1', photo: '', bio: '', posts_counter: 3, created_at: Time.now, role: 'admin', confirmed_at: Time.now, email: "user1@gmail.com", password: '000000', id: 1)
      @post1 =  Post.create!(text: 'I like this moroco', title: 'title post',comments_counter: 3, likes_counter: 8, created_at: Time.now, author_id: @user1.id)
      visit users_path(@user1)
    end

    it 'Should see the user\'s profile picture' do
      images = page.all('img')
      users_profile = page.all('div h2')
      expect(images.size).to eql(users_profile.size)
    end
  end
end