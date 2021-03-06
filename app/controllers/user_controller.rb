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
		@user = User.new user_params
		if @user.save
			log_in @user
			redirect_to root_path
		else
			flash.now[:danger] = 'Error creating user account.'
			render 'new'
			# Failure
		end
	end

	private
		def user_params
			params.require(:user).permit(
					:username, :email,
					:password, :password_confirmation)

		end

end