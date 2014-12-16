module AliensOnEarth

  describe Renderer do
    
    before do
      FileUtils.mkdir(File.expand_path('../../temp_data', __FILE__))
      Renderers::Base.storage_path = File.expand_path('../../temp_data', __FILE__)
    end

    after do
      FileUtils.rm_rf(File.expand_path('../../temp_data', __FILE__))
    end

    it "should be an instance of text renderer" do
      renderer1 = Renderer.new('1')
      renderer2 = Renderer.new('txt')

      expect(renderer1.engine).to be_an_instance_of(Renderers::Text)
      expect(renderer2.engine).to be_an_instance_of(Renderers::Text)
    end

    it "should be an instance of pdf renderer" do
      renderer1 = Renderer.new('2')
      renderer2 = Renderer.new('pdf')

      expect(renderer1.engine).to be_an_instance_of(Renderers::Pdf)
      expect(renderer2.engine).to be_an_instance_of(Renderers::Pdf)
    end

  end

end
