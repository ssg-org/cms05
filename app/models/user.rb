class User < ActiveRecord::Base
	ADMIN_ROLE = 0xffffff

	has_many	:pages
	has_many	:posts
	has_many	:media

	def display_name
		return "#{self.firstname} #{self.lastname}"
	end

	###########################################
	#
	# Pages (move to another module)
	#

	def page(slug_id)
		return self.pages.where(:slug => slug_id).first
	end

	def create_page(title, content, parent_id)
		page = Page.new
		page.set_data(self, title, content, parent_id)
		page.save!
	end

	def update_page(slug_id, title, content, parent_id)
		page = page(slug_id)
		page.set_data(self, title, content, parent_id)
		page.save!
	end

	def destroy_page(slug_id)
		page = page(slug_id)
		page.destroy
	end


	###########################################
	#
	# Posts (move to another module)
	#

	def post(slug_id)
		return self.posts.where(:slug => slug_id).first
	end

	def create_post(title, content)
		post = Post.new
		post.set_data(self, title, content)
		post.save!
	end

	def update_post(slug_id, title, content)
		post = post(slug_id)
		post.set_data(self, title, content)
		post.save!
	end

	def destroy_post(slug_id)
		post = post(slug_id)
		post.destroy
	end


end
