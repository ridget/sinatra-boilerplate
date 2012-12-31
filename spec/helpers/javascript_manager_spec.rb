describe Sinatra::JavascriptManager do
	
	let(:manager){
		Sinatra::JavascriptManager.new
	}

	context 'with single file' do
		before { manager.add_files :one }
		specify { manager.list_files.should eql "<script type='text/javascript' src='/one.js'></script>" }
	end

	context 'with multiple files' do
		before { manager.add_files :one, :two }
		specify { manager.list_files.should eql "<script type='text/javascript' src='/one.js'></script><script type='text/javascript' src='/two.js'></script>" }
	end

end
