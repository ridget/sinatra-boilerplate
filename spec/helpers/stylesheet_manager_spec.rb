describe Ensemble::Helpers::StylesheetsManager do
	let(:stylesheets) {
		Ensemble::Helpers::StylesheetsManager.new
	}

	describe 'formats stylesheets correctly' do

		context 'with an internal file' do
			before do
				stylesheets.add 'dir_1/file_1'
			end
			specify { stylesheets.render.should eq "\n<link rel='stylesheet' href='/stylesheets/dir_1/file_1.css' type='text/css' media='screen' charset='utf-8'>" }
		end

		context 'with an external file' do
			before do
				stylesheets.add 'external/http://static.jquery.com/files/rocker/css/screen.css'
			end
			specify { stylesheets.render.should eq "\n<link rel='stylesheet' href='http://static.jquery.com/files/rocker/css/screen.css' type='text/css' media='screen' charset='utf-8'>" }
		end

	end

end
