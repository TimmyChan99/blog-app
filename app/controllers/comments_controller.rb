class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:notice] = 'Post created successfully'
      redirect_to user_post_path(params[:user_id], params[:post_id])
    else
      flash[:alert] = 'Error: Could not create a post'
      redirect_back(fallback_location: { action: 'new', id: params[:user_id] })
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:alert] = 'Deleted comment'
    redirect_to user_post_path(params[:user_id], params[:post_id])
    authorize! :destroy, @comment
  end

  private

  def comment_params
    c = params.require(:comment).permit(:text)
    c[:post_id] = Post.find(params[:post_id]).id
    c[:author_id] = current_user.id
    c
  end
end
