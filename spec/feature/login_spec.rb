require 'rails_helper'

RSpec.describe 'Hello world', type: :feature do
  describe 'loging page' do
    it 'Should access the log in page' do
      visit 'login'
      expect(page).to have_content('Log in')
    end

    it 'Shoud see the user name, email and pasword field' do
      visit 'login'
      expect(page).to have_field('Email', type: 'email')
      expect(page).to have_field('Password', type: 'password')
      expect(page).to have_button('Log in', type: 'submit')
    end

    it 'Should raise an error if email or password is not filled' do
      visit 'login'
      click_button 'Log in'
      expect(page).to have_content('Invalid Email or password.')
    end

    it 'Should raise an error if email or password is not filled with the correct data' do
      visit 'login'
      fill_in 'Email', with: 'emal@gmail.com'
      fill_in 'Password', with: 'fhdjs'
      click_button 'Log in'
      expect(page).to have_content('Invalid Email or password.')
    end

    it 'Should redirect to the root path if email or password is filled with the correct data' do
      user = User.create!(name: 'Topaz', photo: '', bio: '', posts_counter: 0, created_at: Time.now, role: 'admin',
                          confirmed_at: Time.now, email: 'user@gmail.com', password: '111111')
      visit 'login'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
      expect(page).to have_current_path(root_path)
    end
  end
end
