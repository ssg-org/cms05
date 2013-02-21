class Admin::PagesController < AdminController
	def index
		@pages = Page.includes(:user).all
	end

	def new
		@page = Page.new
		@pages = Page.all
	end

	def create
		@user.create_page(params[:page][:title], params[:page][:content], params[:page][:parent_id])
		redirect_to admin_pages_path()
	end

	def edit
		@page = @user.page(params[:id])
		@pages = Page.all
	end

	def update
		@user.update_page(params[:id], params[:page][:title], params[:page][:content], params[:page][:parent_id])
		redirect_to admin_pages_path()
	end


	def destroy
		@user.destroy_page(params[:id])
		redirect_to admin_pages_path()
	end
end