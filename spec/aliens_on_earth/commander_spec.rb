module AliensOnEarth

  describe Commander do

    before do
      @commander = Commander.new
    end

    it "should be a valid instance" do
      expect(@commander).to be_an_instance_of(Commander)
    end

    it "should initialize questions to an empty hash" do
      expect(@commander.questions).to eq({})
    end

    it "should prompt for a question and store it in the questions hash" do
      @commander.prompt :codename, "Enter Codename", "striker"
      @commander.prompt :blood_color, "Enter Blood Color", "green"

      expect(@commander.questions[:codename]).to_not be(nil) 
      expect(@commander.questions[:blood_color]).to_not be(nil) 

      expect(@commander.questions[:codename][:question]).to eq('Enter Codename') 
      expect(@commander.questions[:blood_color][:question]).to eq('Enter Blood Color') 

      expect(@commander.questions[:codename][:answer]).to eq('striker') 
      expect(@commander.questions[:blood_color][:answer]).to eq('green') 
    end

    it "should return the answer correctly" do
      @commander.prompt :codename, "Enter Codename", "striker"
      expect(@commander.answer_for(:codename)).to eq('striker')
    end

  end

end
