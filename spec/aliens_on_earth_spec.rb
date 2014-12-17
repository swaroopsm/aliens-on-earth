module AliensOnEarth

  describe do
    
    it "should be default to en i18n" do
      expect(DEFAULT_I18N_LANG).to eq('en')
    end

    it "should return the the correct i18n hash" do
      hash = { 'validation' => { 'presence' => 'can\'t be blank', 'file_existence' => 'already exists' } }
      expect(I18n).to eq(hash)
    end

  end

end
