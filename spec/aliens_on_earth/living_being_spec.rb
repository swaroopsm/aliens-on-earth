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

    it "should build accessors from a hash" do
      hash = { :no_of_legs => '2', :planet => 'mars', :blood_color => 'green' }
      @living_being.build_from_keys(hash)

      expect(@living_being.no_of_legs).to eq('2')
      expect(@living_being.planet).to eq('mars')
      expect(@living_being.blood_color).to eq('green')
    end

    it "should return the current object for export data by default" do
      expect(@living_being.export_data).to eq(@living_being)
    end

  end

end
