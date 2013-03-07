class PagesController < ApplicationController

	before_filter :refresh_pager

	layout "themes/#{theme}/layouts/application"

	def show
		@page = @pager.get_page(params[:permalink])
		if @page.nil?
    	render_404  #|| @page.active == false # render_404 on application controller
    else
    	@page_path = @page.path


    	# add all parent pages as breadcrumb
    	@page_path.each do |parent|
    		add_breadcrumb(parent.title, "/#{parent.slug}")
    	end


			render :template => @page.template_path()
		end
	end

end