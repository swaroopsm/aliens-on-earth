module AliensOnEarth

  describe Formatter do

    it "should return all the various renderer engines / formatters" do
      hash = {}
      Dir.glob(File.expand_path('../../../lib/aliens_on_earth/renderers/*', __FILE__)).each_with_index do |renderer, index|
        basename = File.basename(renderer, '.rb')
        hash[(index+1).to_s]  = { :basename => basename, :classname => basename.split("_").map{ |r| r.capitalize }.join, :title => basename.split("_").map{ |r| r.capitalize }[0...-1].join }
      end

      expect(Formatter.all).to eq(hash)
    end

  end

end
