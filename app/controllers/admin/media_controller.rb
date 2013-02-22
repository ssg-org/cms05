class Admin::MediaController < AdminController
	def index
		@media = Medium.all
	end

	def new
		@medium = Medium.new
	end


	def create
		@user.create_media(params[:medium][:attachment])
 		redirect_to admin_media_path()
	end
end