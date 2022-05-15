require 'swagger_helper'

describe 'Register and Login API' do

  path '/api/v1/users/' do

    post 'Create a new user' do
      tags 'user'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          email: { type: :string },
          password: { type: :string }
        },
        required: [ 'name', 'email', 'password']
      }

      response '422', 'user not created' do
        let(:user) { { name: '', email: '', password: '' } }
				run_test! do |response|
					data = JSON.parse(response.body)
					expect(data['message']).to eq('Something is wrong')
				end
      end

      response '201', 'user created' do
        let(:user) { { name: 'user', email: 'user@dev.co', password: '123456' } }
        run_test! do |response|
          data = JSON.parse(response.body)
          expect(data['name']).to eq 'user'
        end
      end
      
    end
  end

  
end
 