class LikesController < ApplicationController

	def new
		@like = Like.new
	end

	def create
		@post = Post.find(params[:post_id])
    @like = Like.new(author_id: current_user.id, post_id: @post.id)

		if @like.save
      flash[:success] = 'Like added successfully'
      redirect_to user_post_path(params[:user_id], params[:post_id])
    else
      flash[:errors] = 'Error: Could not like the post'
      redirect_back(fallback_location: { action: 'new', id: params[:user_id] })
    end
	end

end
