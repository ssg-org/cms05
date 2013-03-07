class Category < ActiveRecord::Base
	has_many	:category_memberships
	has_many  :posts, :through => :category_memberships
end