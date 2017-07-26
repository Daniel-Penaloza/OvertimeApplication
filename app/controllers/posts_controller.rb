class PostsController < ApplicationController
	def index
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(params.require(:post).permit(:date, :rationale))
		if @post.save
			flash[:success] = "The post was created successfully."
			redirect_to @post
		else
			flash[:warning] = "There was a problem trying to create this post."
			render :new
		end
	end

	def show
		@post = Post.find(params[:id])
	end

end
