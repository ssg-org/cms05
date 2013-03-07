module Themes
	class Context

		def self.set_theme(name)
			@@theme = name
			reset_config()
		end

		def self.get_theme()
			return @@theme
		end

		def self.reset_config()
			@@config = eval(File.read("lib/../app/views/themes/#{@@theme}/config.rb"))
		end

		def self.get_templates
			return @@config[:templates]
		end

		set_theme 'cms05'
	end
end