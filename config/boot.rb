ENV['RACK_ENV']			||= 'development'
# DEBUG, INFO, WARN, ERROR, FATAL
ENV['LOGGER_LEVEL']	||= 'DEBUG'

require 'rubygems'
require 'bundler/setup'

Bundler.require(:default, ENV['RACK_ENV'])

require File.expand_path("../application", __FILE__)
require File.expand_path("../database", __FILE__)