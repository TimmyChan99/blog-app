require 'swagger_helper'

describe 'Posts Endpoints' do
  path '/api/v1/users/{id}/posts' do
    get 'List of post of a user' do
      tags 'posts'
      produces 'application/json'
      parameter name: :Authorization, in: :header, type: :string, required: true
      parameter name: :id, in: :path, type: :string

      response '200', 'Post list' do
        @user = User.create(id: 1, name: 'user1', email: 'user1@dev.co', password: '123456')
        let(:Authorization) do
          'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE2NTMyNDQwMDd9.mnFQwhJygd-6SxWrlnc6pf9X-1_-cqQKCjR0ydOX7zY'
        end
        let(:id) { '1' }
        run_test!
      end
    end
  end
end
