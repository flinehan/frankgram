class PostsController < ApplicationController
	def index
	end
	def new
	  @post = Post.create
	end

end
