module AliensOnEarth

  describe BaseRenderer do

    before do
      @base = BaseRenderer.new
    end

    it "should be an instance of base renderer" do
      expect(@base).to be_an_instance_of(BaseRenderer)
    end

    it "should return a valid erb instance" do
      @base.template = File.expand_path('../../fixtures/template.erb', __FILE__)
      
      expect(@base.erb).to be_an_instance_of(ERB)
    end

    it "should assign value of storage path correctly" do
      BaseRenderer.storage_path = File.expand_path('../../temp_data', __FILE__)

      expect(@base.storage_path).to eq(File.expand_path('../../temp_data', __FILE__))
    end

  end

end
