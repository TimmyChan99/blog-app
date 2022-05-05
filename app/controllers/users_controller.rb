class UsersController < ApplicationController
  def index
  @users = User.all
  end

  def show
    console
  @user = User.find(params[:id])
  @posts = @user.recent_tree_posts
  end
end
