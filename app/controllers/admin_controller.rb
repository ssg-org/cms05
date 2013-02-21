class AdminController < ApplicationController
	before_filter :authenticate_user!

	def authenticate_user!
		@user = User.where(:id => session[:id]).first if session[:id]
		if !@user
			redirect_to new_admin_session_path()
		end
	end
end