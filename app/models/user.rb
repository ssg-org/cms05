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

	def create_page(params)
		page = Page.new(params)
		page.user = self
		page.save!
	end

	def update_page(slug_id, params)
		page = page(slug_id)
		page.update_attributes!(params)
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

	def create_post(post_params)
		post = Post.new(post_params)
		post.user = self
		post.save!
	end

	def update_post(slug_id, post_params)
		post = post(slug_id)
		post.update_attributes!(post_params)
	end

	def destroy_post(slug_id)
		post = post(slug_id)
		post.destroy
	end



	###########################################
	#
	# Media (move to another module)
	#
	def create_media(attachment)
 		medium = Medium.new()
 		medium.attachment = attachment
 		medium.user = self
 		medium.title = attachment.original_filename
 		medium.save!
	end



end
