module CMS

	class Pager

		def initialize
			reset_pages
		end

		def page_map
			return @pages
		end

		def get_page(slug_path)
			path = slug_path.split('/')
			return Page.where(:slug => path.last).first
		end

		# return array of pages whosh doesnt have parent
		def root_pages
			return page_map.keys
		end

		# return first root page (Home)
		def home_page
			return root_pages[0]
		end

		def reset_pages
			@pages = Page.arrange
		end

	end
end


