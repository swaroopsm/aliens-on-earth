module AliensOnEarth
  module Renderers

    describe Text do

      before do
        FileUtils.mkdir(File.expand_path('../../../temp_data', __FILE__))
        Renderers::Base.storage_path = File.expand_path('../../../temp_data', __FILE__)

        @text_renderer = Text.new
        @text_renderer.placeholder = 'alien'
        @text_renderer.export_filename = 'striker'

        @alien = Alien.new
        @alien.codename = 'striker'
        @alien.blood_color = 'green'
        @alien.no_of_legs = 4
        @alien.no_of_antennas = 1
        @alien.planet = 'mars'

        @text_renderer.data = @alien
      end

      after do
        FileUtils.rm_rf(File.expand_path('../../../temp_data', __FILE__))
      end

      it "should be an instance of Text" do
        expect(@text_renderer).to be_an_instance_of(Text)
      end

      it "should assign the value of dirname correctly" do
        expect(@text_renderer.dirname).to eq(Text::DIRNAME)
      end

      it "should assign the value of extension correctly" do
        expect(@text_renderer.extension).to eq(Text::EXTENSION)
      end

      it "should create specific directory" do
        @text_renderer.create_storage_dir()
        expect(Dir.exists? File.expand_path('../../../temp_data/alien', __FILE__)).to eq(true)
      end

      it "should return the correct templates path" do
        expect(@text_renderer.template_path('erb')).to eq(File.expand_path('../../../../views/renderers/text/alien.erb', __FILE__))
      end

      it "should return the storage filename correctly" do
        expect(@text_renderer.storage_filename).to eq(File.expand_path('../../../temp_data/alien/striker.txt', __FILE__))
      end

      it "should render the contents correctly" do
        @text_renderer.render
        expect(@text_renderer.contents).to eq(File.read(File.expand_path('../../../fixtures/striker.txt', __FILE__)))
      end

      it "should export the file correctly" do
        @text_renderer.export

        expect(File.exists? File.expand_path('../../../temp_data/alien/striker.txt', __FILE__)).to eq(true)
        expect(File.read(File.expand_path('../../../temp_data/alien/striker.txt', __FILE__))).to eq(File.read(File.expand_path('../../../fixtures/striker.txt', __FILE__)))
      end

    end

  end
end
