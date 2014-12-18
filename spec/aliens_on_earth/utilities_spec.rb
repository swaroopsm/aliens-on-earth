module AliensOnEarth
  describe Utilities do

    before do
      @Utility = Class.new.extend(Utilities)
    end

    it "should return a string that represents a class" do
      expect(@Utility.to_class("text_renderer")).to eq("TextRenderer")
    end

    it "should return a string that is human readable" do
      expect(@Utility.humanize_renderer("pdf_renderer")).to eq("Pdf")
    end

  end
end
