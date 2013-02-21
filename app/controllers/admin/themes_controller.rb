class Admin::ThemesController < AdminController
	def index
		# ApplicationController::theme = 'sample'
		@themes = get_themes()
	end


	def set
		# if get_themes().index(params[:theme])
			ApplicationController.theme = params[:theme]
		# end
	end

	# TODO - move to separate engine
	def get_themes
		Dir['app/views/themes/*'].map { |dir| dir.split('/').last } 
	end
end