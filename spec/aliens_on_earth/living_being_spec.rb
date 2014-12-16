module AliensOnEarth

  describe LivingBeing do
    
    before do
      @living_being = LivingBeing.new
    end

    it "should be a valid instance" do
      expect(@living_being).to be_an_instance_of(LivingBeing)
    end

    it "should consider legs as a valid accessor" do
      expect(@living_being.respond_to? :no_of_legs).to be(true)
      expect(@living_being.respond_to? :no_of_legs=).to be(true)
    end

    it "should consider planet as a valid accessor" do
      expect(@living_being.respond_to? :planet).to be(true)
      expect(@living_being.respond_to? :planet=).to be(true)
    end

    it "should consider blood_color as a valid accessor" do
      expect(@living_being.respond_to? :blood_color).to be(true)
      expect(@living_being.respond_to? :blood_color=).to be(true)
    end

  end

end
