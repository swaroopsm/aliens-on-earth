module AliensOnEarth
  module Renderers

    describe PdfRenderer do

      before do
        FileUtils.mkdir(File.expand_path('../../../temp_data', __FILE__))
        BaseRenderer.storage_path = File.expand_path('../../../temp_data', __FILE__)

        @pdf_renderer = PdfRenderer.new
        @pdf_renderer.placeholder = 'alien'
        @pdf_renderer.export_filename = 'striker'

        @alien = Alien.new
        @alien.codename = 'striker'
        @alien.blood_color = 'green'
        @alien.no_of_legs = 4
        @alien.no_of_antennas = 1
        @alien.planet = 'mars'

        @pdf_renderer.data = @alien
      end

      after do
        FileUtils.rm_rf(File.expand_path('../../../temp_data', __FILE__))
      end

      it "should be an instance of Pdf" do
        expect(@pdf_renderer).to be_an_instance_of(PdfRenderer)
      end

      it "should assign the value of dirname correctly" do
        expect(@pdf_renderer.dirname).to eq(PdfRenderer::DIRNAME)
      end

      it "should assign the value of extension correctly" do
        expect(@pdf_renderer.extension).to eq(PdfRenderer::EXTENSION)
      end

      it "should create an instance of prawn pdf" do
        expect(@pdf_renderer.instance_variable_get(:@pdf)).to be_an_instance_of(Prawn::Document)
      end

      it "should create specific directory" do
        @pdf_renderer.create_storage_dir()
        expect(Dir.exists? File.expand_path('../../../temp_data/alien', __FILE__)).to eq(true)
      end

      it "should return the correct templates path" do
        expect(@pdf_renderer.template_path('pdf')).to eq(File.expand_path('../../../../views/renderers/pdf/alien.pdf', __FILE__))
      end

      it "should return the storage filename correctly" do
        expect(@pdf_renderer.storage_filename).to eq(File.expand_path('../../../temp_data/alien/striker.pdf', __FILE__))
      end

      it "should export the file correctly" do
        @pdf_renderer.export

        expect(File.exists? File.expand_path('../../../temp_data/alien/striker.pdf', __FILE__)).to eq(true)
      end

      it "should return the pdf text object" do
        expect(@pdf_renderer.text("Hello")).to be(@pdf_renderer.instance_variable_get(:@pdf).text("Hello"))
      end

      it "should return the pdf stroke object" do
        expect(@pdf_renderer.stroke_horizontal_rule).to be(@pdf_renderer.instance_variable_get(:@pdf).stroke_horizontal_rule)
      end

      it "should return the pdf define_grid object" do
        expect(@pdf_renderer.define_grid(:columns => 4, :rows => 18, :gutter => 10)).to be_an_instance_of Prawn::Document::Grid
      end

      it "should should return the pdf grid object" do
        expect(@pdf_renderer.grid([0, 0], [0, 1])).to be_an_instance_of(Prawn::Document::MultiBox)
      end

    end

  end
end
