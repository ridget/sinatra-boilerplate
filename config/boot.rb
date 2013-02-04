ENV['APP_NAME']			||= 'ensemble'
ENV['RACK_ENV']			||= 'development'
ENV['LOGGER_LEVEL']	||= 'DEBUG'								# DEBUG, INFO, WARN, ERROR, FATAL

require 'rubygems'
require 'bundler/setup'

Bundler.require(:default, ENV['RACK_ENV'])

###
# Set MEMCACHED_LOCATION to use memcached in application routes
###

#ENV['MEMCACHED_LOCATION']	= YAML.load_file(File.expand_path('../../config/memcached.yml', __FILE__))[ENV['RACK_ENV']]['location']

###
# Set the DB_LOCATION, DB_ADAPTER
#

db_config = YAML.load_file(File.expand_path('../../config/database.yml', __FILE__))[ENV['RACK_ENV']]

ENV['DB_ADAPTER']			= db_config['adapter']
ENV['DB_LOCATION']		= db_config['location']

ENV['DB_USERNAME']		= db_config['username']
ENV['DB_PASSWORD']		= db_config['password']

ENV['DB_AUTOMIGRATE']	= db_config['auto_migrate']
ENV['DB_AUTOUPGRADE']	= db_config['auto_upgrade']

require File.expand_path("../application", __FILE__)
require File.expand_path("../database", __FILE__)

require File.expand_path("../../lib/helpers/asset_manager", __FILE__)
