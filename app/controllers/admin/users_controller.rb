class Admin::UsersController < AdminController
	def index
		@users = User.all
	end

	def new_login
		@user = User.new
	end
end