module AliensOnEarth

  describe Human do
    
    before do
      @human = Human.new
    end

    it "should be a valid instance" do
      expect(@human).to be_an_instance_of(Human)
    end

    it "should be child-class of LivingBeing" do
      expect(@human.class.superclass).to eq(LivingBeing)
    end

    it "should assign the value of legs correctly" do
      expect(@human.legs).to eq(2)
    end

    it "should assign the value of planet correctly" do
      expect(@human.planet).to eq('earth')
    end

    it "should assign the value of blood_color correctly" do
      expect(@human.blood_color).to eq('red')
    end

  end

end
