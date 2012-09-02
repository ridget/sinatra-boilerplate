task :environment do
	require File.expand_path('../../config/boot', __FILE__)
end

Dir.glob(File.expand_path('../lib/tasks/**/*.rake', __FILE__), &method(:load))