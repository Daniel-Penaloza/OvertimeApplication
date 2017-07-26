class PostsController < ApplicationController
	before_action :set_post, only: [:show]
	def index
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id

		if @post.save
			flash[:success] = "The post was created successfully."
			redirect_to @post
		else
			flash[:warning] = "There was a problem trying to create this post."
			render :new
		end
	end

	def show
	end

	private

		def post_params
			params.require(:post).permit(:date, :rationale)
		end

		def set_post
			@post = Post.find(params[:id])
		end
end
