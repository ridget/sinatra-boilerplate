###
# Asset Manager
#
# create specific asset managers in lib/helpers by subclassing Sinatra::AssetManager
# and monkey patching config_settings, format, and path_to
#
# to take advantage of helper methods, also define methods for the particular manager
# a method to add_files, and a helper to list_files
#

module Sinatra
	class AssetManager

		def add_files *files
			@files ||= []
			@files = files
		end

		def list_files *files
			(@files + files + config_files).flatten.uniq.map do |file|
				format file
			end.join
		end

		private

		def config_files
			[]
		end

		def format file
			"#{path_to file}"
		end

		def path_to file
			"#{file}"
		end

	end
end
