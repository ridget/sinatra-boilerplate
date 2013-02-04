describe Ensemble::Helpers::JavascriptsManager do
	let(:javascripts) {
		Ensemble::Helpers::JavascriptsManager.new
	}

	describe 'formats javascript correctly' do

		context 'with an internal file' do
			before do
				javascripts.add 'dir_1/file_1'
			end
			specify { javascripts.render.should eq "\n<script type='text/javascript' charset='utf-8' src='/javascripts/dir_1/file_1.js'></script>" }
		end

		context 'with an external file' do
			before do
				javascripts.add 'external/http://code.jquery.com/jquery.js'
			end
			specify { javascripts.render.should eq "\n<script type='text/javascript' charset='utf-8' src='http://code.jquery.com/jquery.js'></script>" }
		end

	end

end
