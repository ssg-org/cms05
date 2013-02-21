class Admin::PostsController < AdminController
	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new
		@post.title = params[:post][:title]
		@post.content = params[:post][:content]
		@post.save

		redirect_to admin_posts_path()
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		post = Post.find(params[:id])
		post.title = params[:post][:title]
		post.content = params[:post][:content]
		post.save!

		redirect_to admin_posts_path()
	end

	def destroy
		post = Post.find(params[:id])
		post.destroy
		redirect_to admin_posts_path()		
	end

end