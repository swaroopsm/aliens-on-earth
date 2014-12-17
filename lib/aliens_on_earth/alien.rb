module AliensOnEarth

  # The alien class that deals with actions specific to an alien
  class Alien < LivingBeing

    attr_accessor :no_of_antennas
    attr_writer :codename

    # This identifies an alien
    def key
      self.codename || @key
    end

    # Getter for codename
    def codename
      @codename.downcase!

      @codename
    end

    # Register validators
    def validators
      super # call to parent class validators

      validate :presence, :no_of_antennas
      validate :presence, :codename
    end

  end

end
