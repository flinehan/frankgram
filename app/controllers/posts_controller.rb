class PostsController < ApplicationController
	
	#index get all posts
	def index
		@posts = Post.all
	end
	
	#the new view
	def new
		#binds the post var to the view
	    @post = Post.create
	end

	#view new view action
	def create
		@post = Post.create(post_params)
		redirect_to posts_path  
	end

	#edit 'view'
	def edit
		#get the post we want to edit
		@post = Post.find(params[:id])
	end

	#update is the view action
	def update
		#grab the post again
		@post = Post.find(params[:id])
		#update the post
		@post.update(post_params)
		#redirect to the post url for the post
		redirect_to(post_path(@post))
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path
	end

	def show
		@post = Post.find(params[:id])
	end

	private

	def post_params  
	  params.require(:post).permit(:image, :caption)
	end  

end
