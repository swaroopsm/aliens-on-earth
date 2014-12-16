module AliensOnEarth

  # The human class that deals with actions specific to a human
  class Human < LivingBeing

    # Constant attributes
    NUMBER_OF_LEGS = 2
    BLOOD_COLOR = 'red'
    PLANET = 'earth'

    def initialize
      @no_of_legs = NUMBER_OF_LEGS
      @blood_color = BLOOD_COLOR
      @planet = PLANET
    end

  end

end
