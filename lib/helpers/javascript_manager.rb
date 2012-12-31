###
# JavascriptManager
#
# manages lists of javascripts with adds js and javascripts methods
#
# app		- js :'app/public.js'
# view	- <%= javascripts %>

module Sinatra
	class JavascriptManager < Sinatra::AssetManager
		
		private

		def config_files
			[]
		end

		def format file
			"<script type='text/javascript' src='#{path_to file}'></script>"
		end

		def path_to file
			case file
			when nil
				''
			else
				'/' << file.to_s << '.js'
			end
		end

	end
end

module Sinatra
	module Helpers
		
		def js *files
			javascript_manager.add_files files
		end

		def javascripts *files
			javascript_manager.list_files files
		end

		private

		def javascript_manager
			@javascript_manager ||= Sinatra::JavascriptManager.new
		end

	end
end
