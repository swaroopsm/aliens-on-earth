module AliensOnEarth

  describe Alien do
    
    before do
      @alien = Alien.new
      @alien.codename = 'STRIKER'
    end

    it "should be a valid instance" do
      expect(@alien).to be_an_instance_of(Alien)
    end

    it "should be child-class of LivingBeing" do
      expect(@alien.class.superclass).to eq(LivingBeing)
    end

    it "should return the codename as the key" do
      expect(@alien.key).to eq('striker')
    end

    it "should not be a valid alien" do
      expect(@alien.valid?).to be(false)
    end

    it "should be a valid alien" do
      @alien.no_of_antennas = 4
      @alien.no_of_legs = 2
      @alien.blood_color = 'green'
      @alien.planet = 'mars'

      expect(@alien.valid?).to be(true)
    end

  end

end
