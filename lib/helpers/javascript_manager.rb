module Application
	module Helpers
		
		class JavascriptsManager < AssetManager

			private

			def format file
				"\n<script type='text/javascript' charset='utf-8' src='#{path_to(file)}'></script>"
			end

			def format_as_internal file
				"/javascripts/#{file}.js"
			end

		end
	end
end

module Sinatra
	module Helpers

		def javascripts
			@javascripts ||= Application::Helpers::JavascriptsManager.new('javascripts')
		end

	end
end
