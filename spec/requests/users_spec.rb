require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'Test Get users#index' do
    before(:each) do
      get '/users/'
    end
    it 'Test If the correct template was rendered' do
      expect(response).to render_template(:index)
    end
    it 'Test If response status was correct' do
      expect(response).to have_http_status(:ok)
    end
    it 'Test If the response body includes correct placeholder text' do
      expect(response.body).to include('List of Users')
    end
  end

  describe 'Test Get users#show' do
    before(:each) do
      get '/users/index'
    end
    it 'Test If the correct template was rendered' do
      expect(response).to render_template(:show)
    end
    it 'Test If response status was correct' do
      expect(response).to have_http_status(:ok)
    end
    it 'Test If the response body includes correct placeholder text' do
      expect(response.body).to include('The User')
    end
  end
end
