class Api::V1::CommentsController < ApplicationController
  before_action :authenticate_request, only: [:create]

  def index
    @comments = Comment.where(['post_id = :id', { id: params[:post_id].to_s }])
    render json: JSON.pretty_generate(@comments.as_json)
  end

end
