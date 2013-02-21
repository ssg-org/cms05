class Admin::MediaController < AdminController
	def index
		@media = Medium.all
	end

	def new
		@medium = Medium.new
	end

	def create
 		@medium = Medium.new()
 		@medium.attachment = params[:medium][:attachment]
 		@medium.title = params[:medium][:attachment].original_filename
 		@medium.save!

 		redirect_to admin_media_path()
	end
end