describe Sinatra::AssetManager do
	
	let(:manager){
		Sinatra::AssetManager.new
	}

	context 'with single file' do
		before { manager.add_files :one }
		specify { manager.list_files.should eql 'one' }
	end

	context 'with multiple files' do
		before { manager.add_files :one, :two }
		specify { manager.list_files.should eql 'onetwo' }
	end

end
