class Api::V1::CommentsController < ApplicationController

	def index
		@comments = Comment.where(['post_id = :id', { id: params[:post_id].to_s }])
		render json: JSON.pretty_generate(@comments.as_json)
	end
 
 end
 