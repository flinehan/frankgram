class PostsController < ApplicationController
	before_action :set_post, only: [:show, :edit, :update, :destroy]
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
		if @post = Post.create(post_params)
		  flash[:success] = "Your post has been created!"
		  redirect_to posts_path
		else
		  flash[:alert] = "Your new post couldn't be created!  Please check the form."
		  render :new
		end 
	end

	#edit 'view'
	def edit
	end

	#update is the view action
	def update
	    if @post.update(post_params)
	      flash[:success] = "Post updated."
	      redirect_to posts_path
	    else
	      flash[:alert] = "Update failed.  Please check the form."
	      render :edit
	    end
	end

	def destroy
		@post.destroy
		redirect_to posts_path
	end

	def show
	end

	private

	def set_post
		@post = Post.find(params[:id])
	end

	def post_params  
	  params.require(:post).permit(:image, :caption)
	end  

end
