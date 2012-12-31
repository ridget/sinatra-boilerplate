describe Sinatra::StylesheetManager do
	
	let(:manager){
		Sinatra::StylesheetManager.new
	}

	context 'with single file' do
		before { manager.add_files :one }
		specify { manager.list_files.should eql "<link rel='stylesheet' type='text/css' href='/one.css'>" }
	end

	context 'with multiple files' do
		before { manager.add_files :one, :two }
		specify { manager.list_files.should eql "<link rel='stylesheet' type='text/css' href='/one.css'><link rel='stylesheet' type='text/css' href='/two.css'>" }
	end

end
