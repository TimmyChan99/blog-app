class PostsController < ApplicationController
  def index
    @users = User.all
    @user = User.find(params[:user_id])
    @posts = Post.where(['author_id = :id', { id: params[:user_id].to_s }])
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.recent_comments
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user

    if @post.save
      flash[:notice] = 'Post created successfully'
      redirect_to user_posts_path(@post.author)
    else
      flash[:alert] = 'Error: Could not create a post'
      redirect_back(fallback_location: { action: 'new', id: params[:user_id] })
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_posts_path(@post.author)
    authorize! :destroy, @post
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
