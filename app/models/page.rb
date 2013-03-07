require 'themes/context'

class Page < ActiveRecord::Base
	extend FriendlyId

	belongs_to	:user
	belongs_to	:state

	friendly_id :title, :use => :slugged
	has_ancestry

	def template_path()
		theme = Themes::Context.get_theme()
		return self.template.blank? ? "themes/#{theme}/page/show" : "themes/#{theme}/#{self.template}"
	end

end