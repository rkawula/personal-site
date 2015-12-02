class PostController < ApplicationController

	def index
		@posts = Post.get_visible_ordered_posts
	end

	def show
		begin
			@post = Post.find params[:id]
			unless @post.visible
				@post = nil
				flash[:danger] = 'That post not found'
				redirect_to post_index_path
			end
		rescue ActiveRecord::RecordNotFound
			flash[:danger] = 'That post not found'
			redirect_to post_index_path
		end
	end

	def new
		render 'admin/permission_denied' unless admin?
	end

	def create
		@post = Post.new post_params
		@post.author = current_user.username
		if @post.save
			flash[:info] = "Success creating post."
			if @post.visible
				redirect_to post_path(@post)
			else
				redirect_to post_index_path
			end
		else
			flash.now[:danger] = "Something went wrong!"
			render new_post_path
		end
	end

	def continue
		@posts = Post.where visible: false
	end

	def edit
		@post = Post.find params[:id]
	end

	def update
		@post = Post.find params[:id]
		@post.author = current_user.username
		if @post.update_attributes post_params
			if @post.visible
				flash[:info] = 'Posted!'
				redirect_to post_path(@post)
			else
				flash[:info] = 'Changes saved.'
				redirect_to continue_post_path
			end
		else
			flash[:danger] = 'Error saving to database!!!'
			redirect_to continue_post_path
		end
	end

	private
		def post_params
			params.require(:post).permit(
					:title, :visible, :subtitle,
					:content)
		end

end
