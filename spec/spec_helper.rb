require	'simplecov'
SimpleCov.start

ENV['RACK_ENV'] = 'test'

require File.expand_path('../../config/boot', __FILE__)

RSpec.configure do |config|
	config.include(DataMapper::Matchers)
	config.before(:each) { DataMapper.auto_migrate! }
	config.tty							= true
	config.full_backtrace		= true
	config.full_description	= true
end