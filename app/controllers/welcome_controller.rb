class WelcomeController < ApplicationController

	def index
		@posts = Post.all
	end

	def about
	end

	def resume
	end

	def post
	end

end