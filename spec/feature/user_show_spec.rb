require 'rails_helper'

RSpec.describe 'Blog app', type: :feature do
  describe ' user index show page' do
    before(:each) do
      @user1 = User.create!(name: 'User1', photo: '', bio: 'this is the bio', posts_counter: 2, created_at: Time.now, role: 'admin', confirmed_at: Time.now, email: "user1@gmail.com", password: '000000', id: 1)
      @post = @user1.posts.create!(title: "Sample", text: 'lolololo')
      visit user_posts_path(@user1)
    end

    it 'Should see the user\'s profile picture' do
      images = page.all('img')
      users_profile = page.all('div h2')
      expect(images.size).to eql(users_profile.size)
    end

    it "Should see the username of the user" do
      expect(page).to have_content(@user1.name)
    end

    it "Should see each user's post number" do
      page.has_selector?('p', text: 'Number of posts: 2')
    end

    it "Should see the user's bio" do
      page.has_selector?('article', text: 'this is the bio')
    end

    it 'Should  the user\'s first three posts' do
      posts = page.all('li p')
      expect(posts.length).to be < 4
    end

    it 'Should redirects to that post\'s show page.' do
      click_link 'Sample'
      expect(page).to have_current_path(user_post_path(@user1, @post))
    end

    # it 'Should redirects to that post\'s show page.' do
    #   click_button "See all posts"
    #   expect(page).to have_current_path(user_posts_path(@user1))
    # end

  end
end