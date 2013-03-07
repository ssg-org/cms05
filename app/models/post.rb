class Post < ActiveRecord::Base
	include ActiveModel::ForbiddenAttributesProtection
	extend FriendlyId

	belongs_to	:user
	belongs_to	:state

	has_many		:category_memberships
	has_many  	:categories, :through => :category_memberships

	friendly_id :title, :use => :slugged

	# def set_data(user, title, content, category_ids = [])
	# 	self.user = user
	# 	self.title = title
	# 	self.content = content

	# 	# remove all categories than add them back (optimize this !!!!)
	# 	new_categories = Category.where(:id => category_ids).all
	# 	self.categories = new_categories
	# end
end