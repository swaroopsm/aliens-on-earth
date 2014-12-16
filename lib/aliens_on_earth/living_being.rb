module AliensOnEarth

  # Abstract class for all living beings
  class LivingBeing

    include Validator

    attr_accessor :no_of_legs, :planet, :blood_color
    attr_reader :key

    def initialize
      @key = SecureRandom.uuid
    end

    # Export data that will be used in templates
    # This will be available as @data in all the templates
    def export_data
      self
    end

    # Export data into a suitable format that will be exported using the rendering engines
    def export(format)
      renderer = Renderer.new(format)
      engine = renderer.engine
      engine.placeholder = self.class.name.split('::').last.downcase
      engine.data = self.export_data
      engine.export_filename = self.key

      if valid?
        engine.export
      else
        puts "xxxxxxxxxxxxxxxxxxxxxx"
        puts "Validation Errors!"
        puts "xxxxxxxxxxxxxxxxxxxxxx"
        @validation_messages.each { |message| puts message }

        puts
        puts "Try again!"
      end
    end

    # Construct accessors from hash
    def build_from_keys(hash)
      hash.each { |key, value| instance_variable_set("@#{key}", value) }
    end

    # All the validators
    def validators
      validate :presence, :no_of_legs
      validate :presence, :planet
      validate :presence, :blood_color
    end

  end

end
