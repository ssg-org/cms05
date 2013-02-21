class Admin::PostsController < AdminController
	def index
		@posts = Post.includes(:user).all
	end

	def new
		@post = Post.new
	end

	def create
		@user.create_post(params[:post][:title], params[:post][:content])
		redirect_to admin_posts_path()
	end

	def edit
		@post = @user.post(params[:id])
	end

	def update
		@user.update_post(params[:id], params[:post][:title], params[:post][:content])
		redirect_to admin_posts_path()
	end

	def destroy
		@user.destroy_post(params[:id])
		redirect_to admin_posts_path()		
	end

end