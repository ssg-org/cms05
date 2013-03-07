class Admin::PagesController < AdminController
	def index
		@pages = Page.includes(:user).all
	end

	def new
		@page = Page.new
		@pages = Page.all
	end

	def create
		@user.create_page(page_params)
		redirect_to admin_pages_path()
	end

	def edit
		@page = @user.page(params[:id])
		@pages = Page.all
	end

	def update
		@user.update_page(params[:id], page_params)
		redirect_to admin_pages_path()
	end


	def destroy
		@user.destroy_page(params[:id])
		redirect_to admin_pages_path()
	end

private
	
	def page_params
    params.require(:page).permit(:title, :content, :parent_id, :template)
	end
end