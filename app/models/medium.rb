class Medium < ActiveRecord::Base 
	extend FriendlyId

	friendly_id :title, :use => :slugged

	has_attached_file :attachment

end
