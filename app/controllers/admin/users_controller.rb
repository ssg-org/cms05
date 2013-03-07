class Admin::UsersController < AdminController
	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def new_login
		@user = User.new
	end
end