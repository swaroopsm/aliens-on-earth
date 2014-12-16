module AliensOnEarth

  describe LivingBeing do
    
    before do
      @living_being = LivingBeing.new
    end

    it "should be a valid instance" do
      expect(@living_being).to be_an_instance_of(LivingBeing)
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

    it "should not be a valid living being" do
      expect(@living_being.valid?).to be(false)
    end

    it "should have a the messages of size 3" do
      @living_being.valid?
      expect(@living_being.validation_messages.size).to eq(3)
    end

    it "should be a valid living being" do
      @living_being.no_of_legs = 4
      @living_being.blood_color = 'red'
      @living_being.planet = 'mercury'

      expect(@living_being.valid?).to be(true)
    end

  end

end
