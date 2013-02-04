describe Ensemble::Helpers::AssetManager do

	let(:asset_manager) {

		Ensemble::Helpers::AssetManager.new
	}

	describe 'adding via configuration file' do
		context 'with 0 arguments' do
			before do
				Ensemble::Helpers::AssetManager.any_instance.stub(:load_config).and_return({})
			end
			specify { asset_manager.render.should eq '' }
		end

		context 'with multiple categories, and multiple children' do
			before do
				Ensemble::Helpers::AssetManager.any_instance.stub(:load_config).and_return({
					'dir_1' => ['file_1', 'file_2'],
					'dir_2' => ['file_3', 'file_4'],
				})
			end
			specify { asset_manager.render.should include 'dir_1/file_1' }
			specify { asset_manager.render.should include 'dir_1/file_2' }
			specify { asset_manager.render.should include 'dir_2/file_3' }
			specify { asset_manager.render.should include 'dir_2/file_4' }

			specify { asset_manager.render.should_not include 'dir_2/file_1' }
			specify { asset_manager.render.should_not include 'dir_2/file_2' }
			specify { asset_manager.render.should_not include 'dir_1/file_3' }
			specify { asset_manager.render.should_not include 'dir_1/file_4' }
		end
	end

	describe 'adding via add' do
		context 'with 0 arguments' do
			before do
				asset_manager.add
			end
			specify { asset_manager.render.should eq '' }
		end

		context 'with 1 arguments' do
			before do
				asset_manager.add 'app/file'
			end
			specify { asset_manager.render.should eq 'app/file' }
		end

		context 'with 2 arguments' do
			before do
				asset_manager.add 'app/file_1', 'app/file_2'
			end
			specify { asset_manager.render.should include 'app/file_1' }
			specify { asset_manager.render.should include 'app/file_2' }
		end
	end

	describe 'adding via render' do
		context 'with 0 arguments' do
			specify { asset_manager.render.should eq ''}
		end

		context 'with 1 argument' do
			specify { asset_manager.render('app/file').should eq 'app/file'}
		end

		context 'with 2 arguments' do
			specify { asset_manager.render('app/file_1', 'app/file_2').should include 'app/file_1' }
			specify { asset_manager.render('app/file_1', 'app/file_2').should include 'app/file_2' }
		end
	end

end
