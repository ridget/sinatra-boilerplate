require 'rspec/core/rake_task'

namespace :spec do
	
	desc "run all specifications"
	RSpec::Core::RakeTask.new(:all) do |test|
  	test.pattern = "./spec/**/*_spec.rb"
	end
	
end