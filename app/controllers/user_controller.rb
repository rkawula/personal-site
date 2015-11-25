class UserController < ApplicationController

	def show
		@user = User.find_by_username params[:username]
	end

	def login
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new params[:user]
		if @user.save
			# Success
		else
			render 'new'
			# Failure
		end
	end

end