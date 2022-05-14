require 'swagger_helper'

describe 'Posts API' do

  path '/api/v1/users/4/posts' do

    post 'Access posts for a users' do
      tags 'Posts'
      consumes 'application/json'
			parameter name: :Authorization, in: :header, type: :string
      parameter name: :posts, in: :body, schema: {
        type: :object,
        properties: {
          user_id: { type: :integer },
          post_id: { type: :integer }
        },
        required: %w[user_id post_id]
      }

      response '201', 'pet created' do
        let(:posts) { { user_id: 1, posts: 4, status: 'available' } }
        run_test!
      end

      
    end
  end
end
 