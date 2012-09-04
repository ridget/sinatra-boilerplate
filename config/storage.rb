module Storage
	
	class Memcached
		
		def self.client
			@memcached_client	||= init YAML.load_file(File.expand_path('../../config/memcached.yml', __FILE__))[ENV['RACK_ENV']]
		end
		
		def self.init(config)
			puts 'initializing'
			client = Dalli::Client.new config['location']
		end
		
		def self.set(key, value)
			client.set("#{ENV['APPLICATION_NAME']}_#{key}", value)
		end
		
		def self.get(key)
			client.get("#{ENV['APPLICATION_NAME']}_#{key}")
		end
		
	end
	
	class Database
		
		def self.client
			@client ||= init YAML.load_file(File.expand_path('../../config/database.yml', __FILE__))[ENV['RACK_ENV']]
		end
		
		def self.init(config)
			@adapter	= config['adapter']
			@location	= config['location']
			@database	= config['database']
			
			unless setup
				puts 'stopping'
				return false
			end
			
			Dir.glob(File.expand_path('../../app/models/**', __FILE__), &method(:require))
			
			if config['auto_migrate']
				@auto_migrate	= true
				DataMapper.finalize.auto_migrate!
			elsif config['auto_update']
				@auto_update	= true
				DataMapper.finalize.auto_upgrade!
			else
				DataMapper.finalize
			end
			
			"#{@adapter}://#{@location}/#{@database}"
		end
		
		def self.setup
			case @adapter
			when 'sqlite'
				DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/#{@location}/#{@database}")
			when 'postgres'
				DataMapper.setup(:default, "postgres://#{@location}/#{@database}")
			when 'mysql'
				DataMapper.setup(:default, "mysql://#{@location}/#{@database}")
			when 'mongodb'
				DataMapper.setup(:default, "mongo://#{@location}/#{@database}")
			else
				false
			end
		end
		
	end
	
end

ENV['DATABASE_URL']		= Storage::Database.client