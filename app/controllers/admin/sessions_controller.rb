class Admin::SessionsController < ApplicationController
	layout 'session'

	def new
	end

	def create
		user = User.where(:email => params[:email]).first

		if (user && user.encrypted_password == Digest::SHA256.hexdigest(params[:password]))
			session[:id] = user.id
			redirect_to admin_pages_path()
		else
			flash[:alert] = 'Invalid credentials'
			redirect_to new_admin_session_path()
		end
	end
end