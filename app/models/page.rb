class Page < ActiveRecord::Base
	extend FriendlyId

	belongs_to	:user

	has_ancestry
	
	friendly_id :title, :use => :slugged

	def set_data(user, title, content, parent_id)
		self.user = user
		self.title = title
		self.content = content
		self.parent = Page.find(parent_id) if !parent_id.blank?
	end
end