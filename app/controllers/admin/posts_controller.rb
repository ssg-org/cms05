class Admin::PostsController < AdminController
	def index
		@posts = Post.includes([:user, :categories]).all
	end

	def new
		@post = Post.new
	end

	def create
		@user.create_post(post_params)
		redirect_to admin_posts_path()
	end

	def edit
		@post = @user.post(params[:id])
	end

	def update
		@user.update_post(params[:id], post_params)
		redirect_to admin_posts_path()
	end

	def destroy
		@user.destroy_post(params[:id])
		redirect_to admin_posts_path()		
	end

private
	def post_params
    params.require(:post).permit(:title, :content, :category_ids, :meta)
  end
end