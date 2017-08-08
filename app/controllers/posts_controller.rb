class PostsController < ApplicationController
	before_action :set_post, only: [:show, :edit, :update, :destroy, :approve]
	def index
		@posts = Post.posts_by(current_user).page(params[:page]).per(10)
	end

	def approve
		authorize @post
		@post.approved!
		redirect_to root_path
		flash[:info] = "The post has been approved"
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

	def edit
		authorize @post
	end

	def update
		authorize @post
		
		if @post.update(post_params)
			flash[:success] = "The post was successfully update"
			redirect_to post_path(@post)
		else
			flash[:danger] = "The post can't be updated"
			render :edit
		end
	end

	def destroy
		@post.destroy
		flash[:warning] = "The post was deleted"
		redirect_to posts_path
	end

	private

		def post_params
			params.require(:post).permit(:date, :rationale, :status, :overtime_request)
		end

		def set_post
			@post = Post.find(params[:id])
		end
end
