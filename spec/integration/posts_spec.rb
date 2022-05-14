require 'swagger_helper'

describe 'Register and Login API' do

  path '/api/v1/users/' do

    post 'Create a user' do
      tags 'user'
      consumes 'application/json'

      response '422', 'pet created' do
				run_test! do |response|
					data = JSON.parse(response.body)
					expect(data['message']).to eq('Something is wrong')
				end
      end

      
    end
  end
end
 