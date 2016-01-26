class WelcomeController < ApplicationController

	def index
		@posts = Post.get_visible_ordered_posts
	end

	def about
	end

	def resume
	end

	def login
	end

	def projects
	end

end