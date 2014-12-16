module AliensOnEarth
  module Validator

    attr_accessor :validators, :validation_status, :validation_messages

    def validate(type, accessor)
      @validators ||= {}
      @validators[type] ||= {}

      @validators[type][accessor] = self.send("validate_" + type.to_s, accessor)
    end

    # Validates presence
    def validate_presence(_accessor)
      accessor = self.instance_variable_get("@#{_accessor}")

      return false if accessor.nil?
      return false if accessor.to_s.strip.empty?

      return true
    end

    def valid?
      self.validators
      @validation_messages ||= []

      @validators.each do |key, value|
        @validators[key].each do |attribute, status|
          @validation_status = false if status == false
          @validation_messages << key.to_s.capitalize + " of " + attribute.to_s.split('_').join(' ').capitalize + " failed"
        end
      end

      status = @validation_status.nil? ? true : @validation_status

      return status
    end

  end
end
