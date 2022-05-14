class UsersController < ApplicationController
  skip_before_action :authenticate_request
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.recent_tree_posts
  end
end
