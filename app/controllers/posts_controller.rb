class PostsController < ApplicationController
  def index
    @users = User.all
    @user = User.find(params[:user_id])
    @posts = Post.where(['author_id = :id', { id: params[:user_id].to_s }])
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.recent_comments
    @users = User.all
  end
end
