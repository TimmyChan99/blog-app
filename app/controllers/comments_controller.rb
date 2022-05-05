class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:success] = 'Post created successfully'
      redirect_to user_post_path(params[:user_id], params[:post_id])
    else
      flash[:errors] = 'Error: Could not create a post'
      redirect_back(fallback_location: { action: 'new', id: params[:user_id] })
    end
  end

  private

  def comment_params
    c = params.require(:comment).permit(:text)
    c[:post_id] = Post.find(params[:post_id]).id
    c[:author_id] = current_user.id
    c
  end
end
