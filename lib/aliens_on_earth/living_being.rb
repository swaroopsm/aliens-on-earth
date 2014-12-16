module AliensOnEarth

  # Abstract class for all living beings
  class LivingBeing

    attr_accessor :no_of_legs, :planet, :blood_color

    def initialize
      @key = SecureRandom.uuid
    end

    def export_data
      self
    end

    def export(format)
      renderer = Renderer.new(format)
      engine = renderer.engine
      engine.placeholder = self.class.name.split('::').last.downcase
      engine.data = self.export_data
      engine.export_filename = self.key

      engine.export
    end

    def build_from_keys(hash)
      hash.each { |key, value| instance_variable_set("@#{key}", value[:answer]) }
    end

  end

end
