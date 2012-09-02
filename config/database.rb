module Database
	
	class Adapter
		
		def initialize(config)
			@adapter	= config['adapter']
			@database	= config['database']
			
			unless setup @adapter, @database
				puts 'stopping'
				return false
			end
			
			Dir.glob(File.expand_path('../../app/models/**', __FILE__), &method(:require))
			
			if config['auto_migrate']
				@auto_migrate = true
				DataMapper.finalize.auto_migrate!
			elsif config['auto_update']
				@auto_update = true
				DataMapper.finalize.auto_upgrade!
			else
				DataMapper.finalize
			end
			
		end
		
		def setup(adapter, database)
			case adapter
			when 'sqlite'
				DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/#{database}")
			when 'postgresql'
				false
			when 'mysql'
				false
			when 'mongodb'
				false
			else
				false
			end
		end
		
	end
	
end

Database::Adapter.new YAML.load_file(File.expand_path('../../config/database.yml', __FILE__))[ENV['RACK_ENV']]