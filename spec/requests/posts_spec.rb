require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'Test Get posts#index' do
    before(:each) do
      get '/users/index/posts/'
    end
    it 'Test If the correct template was rendered' do
      expect(response).to render_template(:index)
    end
    it 'Test If response status was correct' do
      expect(response).to have_http_status(:ok)
    end
    it 'Test If the response body includes correct placeholder text' do
      expect(response.body).to include('list of posts')
    end
  end

  describe 'Test Get posts#show' do
    before(:each) do
      get '/users/index/posts/show'
    end
    it 'Test If the correct template was rendered' do
      expect(response).to render_template(:show)
    end
    it 'Test If response status was correct' do
      expect(response).to have_http_status(:ok)
    end
    it 'Test If the response body includes correct placeholder text' do
      expect(response.body).to include('List of Posts')
      expect(response.body).to include('post#show')
    end
  end
end
