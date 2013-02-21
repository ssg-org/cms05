class Medium < ActiveRecord::Base 
	extend FriendlyId

	belongs_to	:user
	has_attached_file :attachment

	friendly_id :title, :use => :slugged


end
