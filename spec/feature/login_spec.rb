require 'rails_helper'

RSpec.describe 'Hello world', type: :feature do
  describe 'index page' do
    it 'Should access the log in page' do
      visit 'login'
      expect(page).to have_content('Log in')
    end

    it 'Shoud see the user name, email and pasword field' do
      visit 'login'
      expect(page).to have_field('Email', type: 'email', disabled: true)
      expect(page).to have_field('Password', type: 'password', disabled: true)
      expect(page).to have_button('Log in', type: 'submit')
    end
    
  end
end