class SessionsController < ApplicationController
  def new

  end

  def create
  	user = User.find_by_username params[:session][:username].downcase
  	if user && user.authenticate(params[:session][:password])
  		log_in user
  		flash[:info] = "Welcome, #{current_user.username}!"
  		redirect_to profile_path(user.username)
  	else
  		flash.now[:danger] = 'Invalid email/password.'
  		render 'new'
  	end
  end

  def destroy
  	flash[:info] = 'Successfully logged out.'
  	log_out
  	redirect_to root_path
  end
end
