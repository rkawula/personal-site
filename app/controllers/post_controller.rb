class PostController < ApplicationController

	def index
		@posts = Post.reverse_date
	end

	def show
		@post = Post.find params[:id]
	end
end
