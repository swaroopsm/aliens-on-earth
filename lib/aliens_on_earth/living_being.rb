module AliensOnEarth

  # Abstract class for all living beings
  class LivingBeing

    attr_accessor :no_of_legs, :planet, :blood_color
    attr_reader :key

    def initialize
      @key = SecureRandom.uuid
    end

    # Export data that will be used in templates
    def export_data
      self
    end

    # Export data into a suitable format
    def export(format)
      renderer = Renderer.new(format)
      engine = renderer.engine
      engine.placeholder = self.class.name.split('::').last.downcase
      engine.data = self.export_data
      engine.export_filename = self.key

      engine.export
    end

    # Construct accessors from hash
    def build_from_keys(hash)
      hash.each { |key, value| instance_variable_set("@#{key}", value) }
    end

  end

end
