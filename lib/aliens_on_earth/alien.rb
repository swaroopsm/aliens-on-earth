module AliensOnEarth

  # The alien class that deals with actions specific to an alien
  class Alien < LivingBeing

    attr_accessor :no_of_antennas, :codename

    def key
      self.codename || @key
    end

    def validators
      super
      validate :presence, :no_of_antennas
      validate :presence, :codename
    end

  end

end
