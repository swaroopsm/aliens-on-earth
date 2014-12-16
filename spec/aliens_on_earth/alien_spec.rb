module AliensOnEarth

  describe Alien do
    
    before do
      @alien = Alien.new
      @alien.codename = 'striker'
    end

    it "should be a valid instance" do
      expect(@alien).to be_an_instance_of(Alien)
    end

    it "should be child-class of LivingBeing" do
      expect(@alien.class.superclass).to eq(LivingBeing)
    end

    it "should consider no_of_antennas as a valid accessor" do
      expect(@alien.respond_to? :no_of_antennas).to eq(true)
      expect(@alien.respond_to? :no_of_antennas=).to eq(true)
    end

    it "should consider codename as a valid accessor" do
      expect(@alien.respond_to? :codename).to eq(true)
      expect(@alien.respond_to? :codename=).to eq(true)
    end
    
    it "should return the codename as the key" do
      expect(@alien.key).to eq('striker')
    end

  end

end
