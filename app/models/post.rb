class Post < ActiveRecord::Base
	extend FriendlyId

	belongs_to	:user

	friendly_id :title, :use => :slugged

	def set_data(user, title, content)
		self.user = user
		self.title = title
		self.content = content
	end
end