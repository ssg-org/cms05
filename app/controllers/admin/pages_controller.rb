class Admin::PagesController < AdminController
	def index
		@pages = Page.all
	end

	def new
		@page = Page.new
		@pages = Page.all
	end

	def create
		page = Page.new
		page.title = params[:page][:title]
		page.content = params[:page][:content]
		page.parent = Page.find(params[:page][:parent_id]) if !params[:page][:parent_id].blank?
		page.save!
		redirect_to admin_pages_path()
	end

	def edit
		@page = Page.find(params[:id])
		@pages = Page.all
	end

	def update
		page = Page.find(params[:id])
		page.title = params[:page][:title]
		page.content = params[:page][:content]
		page.parent = Page.find(params[:page][:parent_id]) if !params[:page][:parent_id].blank?
		page.save!

		redirect_to admin_pages_path()
	end

	def destroy
		page = Page.find(params[:id])
		page.destroy
		redirect_to admin_pages_path()
	end
end