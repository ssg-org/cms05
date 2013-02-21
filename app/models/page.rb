class Page < ActiveRecord::Base
	extend FriendlyId

	has_ancestry
	
	friendly_id :title, :use => :slugged
end