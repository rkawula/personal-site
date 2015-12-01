class PostController < ApplicationController

	def index
		@posts = Post.reverse_date
	end

	def show
		@post = Post.find params[:id]
	end

	def new
		render 'admin/permission_denied' unless admin?
	end
end
