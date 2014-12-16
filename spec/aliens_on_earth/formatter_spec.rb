module AliensOnEarth

  describe Formatter do

    it "should return true if format is text" do
      expect(Formatter.text? 1).to eq(true)
      expect(Formatter.text? '1').to eq(true)
      expect(Formatter.text? 'txt').to eq(true)
    end

    it "should return true if format is pdf" do
      expect(Formatter.pdf? 2).to eq(true)
      expect(Formatter.pdf? '2').to eq(true)
      expect(Formatter.pdf? 'pdf').to eq(true)
    end

  end

end
