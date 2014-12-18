module AliensOnEarth

  describe Formatter do

    it "should return all the various renderer engines / formatters" do
      hash = {
        '1' => { :basename => 'pdf_renderer', :classname => 'PdfRenderer', :title => 'Pdf' },
        '2' => { :basename => 'text_renderer', :classname => 'TextRenderer', :title => 'Text' }
      }

      expect(Formatter.all).to eq(hash)
    end

  end

end
