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

  path '/api/v1/auth/login' do
    
    post 'Log in for an existing user' do
      tags 'user'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          password: { type: :string }
        },
        required: ['email', 'password']
      }

      response '200', 'loged in' do
       @user = User.create(name: 'user', email: 'user@dev.co', password: '123456')
        let(:user) { { email: 'user@dev.co', password: '123456' } }
        run_test! do |response|
            data = JSON.parse(response.body)
            SECRET_KEY = Rails.application.secrets.secret_key_base
            decoded = JWT.decode(data['token'], SECRET_KEY)[0]
            expect(decoded['user_id']).to eq 10
          end
      end
    end
  end
end
 