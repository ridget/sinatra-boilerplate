require	'simplecov'
SimpleCov.start

ENV['RACK_ENV'] = 'test'

require File.expand_path('../../config/boot', __FILE__)

def session
  last_request.env['rack.session']
end

def form_errors
	last_request.env['rack.session'][:__FORMERRORS__] || {}
end

def json_response
	JSON.parse last_response.body
end

RSpec.configure do |config|
	config.include(DataMapper::Matchers)
	config.before(:each) { DataMapper.auto_migrate! }
end
