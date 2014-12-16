module AliensOnEarth

  # The alien class that deals with actions specific to an alien
  class Alien < LivingBeing

    attr_accessor :no_of_antennas, :codename

    def key
      self.codename || @key
    end

  end

end
