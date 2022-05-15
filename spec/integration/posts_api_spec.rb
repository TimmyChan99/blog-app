# require 'swagger_helper'

# describe 'Posts Endpoints' do

#   path '/api/v1/users/{user_id}/posts' do

#     post 'Create a new user' do
#       tags 'posts'
#       consumes 'application/json'
#       parameter name: :user_id, in: :path, schema: {
#         type: :integer,
#         properties: {
#           user_id: { type: :integer }
#         },
#         required: [ 'user_id' ]
#       }

#       response '422', 'user not created' do
#         let(:user) { { name: '', email: '', password: '' } }
# 				run_test! do |response|
# 					data = JSON.parse(response.body)
# 					expect(data['message']).to eq('Something is wrong')
# 				end
#       end

      
#     end
#   end
# end
