require 'swagger_helper'

describe 'Posts Endpoints' do
  path '/api/v1/users/{user_id}/posts/{post_id}/comments' do
    post 'create a comment' do
      tags 'posts'
      produces 'application/json'
      parameter name: :post_id, in: :path, type: :string, required: true
      parameter name: :user_id, in: :path, type: :string, required: true
      parameter name: :Authorization, in: :header, type: :string, required: true
      parameter name: :comment, in: :body, type: :string

      response '201', 'Comment Created' do
        # @user = User.create!(id: 2, name: 'user2', email: 'user2@dev.co', password: '123456')
        Post.create!(id: 3, title: 'title', text: 'post', author_id: 1)
        let(:user_id) { '2' }
        let(:post_id) { '3' }
        let(:Authorization) do
          'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE2NTMyNDQwMDd9.mnFQwhJygd-6SxWrlnc6pf9X-1_-cqQKCjR0ydOX7zY'
        end
        let(:comment) { 'comment' }
        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data['message']).to eq 'Comment created successfuly'
        end
      end
    end

    get 'List of comment' do
      tags 'posts'
      produces 'application/json'
      parameter name: :post_id, in: :path, type: :string, required: true
      parameter name: :user_id, in: :path, type: :string, required: true
      parameter name: :Authorization, in: :header, type: :string, required: true

      response '200', 'Comment list' do
        let(:user_id) { '1' }
        let(:post_id) { '1' }
        let(:Authorization) do
          'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE2NTMyNDQwMDd9.mnFQwhJygd-6SxWrlnc6pf9X-1_-cqQKCjR0ydOX7zY'
        end
        run_test!
      end
    end
  end
end
