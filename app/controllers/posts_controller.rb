class PostsController < ApplicationController 

	layout "themes/#{theme}/layouts/application"

	def index
		add_breadcrumb('Posts', '/')
		
		@posts = Post.order('created_at desc')
		render :template => "themes/#{theme}/posts/index"
	end

	def show
		@post = Post.where(:slug => params[:id]).first

		if @post.nil?
    	render_404 
  	else 
			add_breadcrumb('Posts', '/')
			add_breadcrumb(@post.title, post_path(@post.slug))
			render :template => "themes/#{theme}/posts/show"
  	end
	end

end