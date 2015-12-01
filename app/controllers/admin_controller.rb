class AdminController < ApplicationController

def index
	unless logged_in? && admin?
		render 'permission_denied'
	else
		render 'index'
	end
end

end