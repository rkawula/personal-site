class WelcomeController < ApplicationController

	def index
		@posts = Post.reverse_date
	end

	def about
	end

	def resume
	end

end