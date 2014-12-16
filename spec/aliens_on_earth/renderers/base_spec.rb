module AliensOnEarth
  module Renderers

    describe Base do

      before do
        @base = Base.new
      end

      it "should be an instance of base renderer" do
        expect(@base).to be_an_instance_of(Base)
      end

      it "should return a valid erb instance" do
        @base.template = File.expand_path('../../../fixtures/template.erb', __FILE__)
        
        expect(@base.erb).to be_an_instance_of(ERB)
      end

      it "should assign value of storage path correctly" do
        Base.storage_path = File.expand_path('../../../temp_data', __FILE__)

        expect(Base.storage_path).to eq(File.expand_path('../../../temp_data', __FILE__))
      end

    end

  end
end
