###
# StylesheetManager
#
# manages lists of stylesheets with adds css and stylesheets methods
#
# app		- css :'app/public.css'
# view	- <%= stylesheets %>

module Sinatra
	class StylesheetManager < Sinatra::AssetManager

		private

		def config_files
			[]
		end

		def format file
			"<link rel='stylesheet' type='text/css' href='#{path_to file}'>"
		end

		def path_to file
			case file
			when nil
				''
			else
				file.to_s + '.css'
			end
		end

	end
end

module Sinatra
	module Helpers

		def css *files
			stylesheet_manager.add_files files
		end

		def stylesheets *files
			stylesheet_manager.list_files files
		end

		private

		def stylesheet_manager
			@stylesheet_manager ||= Sinatra::StylesheetManager.new
		end

	end
end
