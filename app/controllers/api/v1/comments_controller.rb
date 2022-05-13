class Api::V1::CommentsController < ApplicationController
  before_action :authenticate_request, only: [:create]

 
end
