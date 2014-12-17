module AliensOnEarth
  module Validator

    attr_accessor :validators, :validation_status, :validation_messages

    # Method that pushes all validations
    def validate(type, _accessor)
      @validators ||= {}
      @validators[type] ||= {}
      accessor = self.send("validate_" + type.to_s, _accessor)

      @validators[type][_accessor] = accessor
    end

    # Validates presence
    def validate_presence(_accessor)
      accessor = get_accessor(_accessor)

      return false if accessor.nil?
      return false if accessor.to_s.strip.empty?

      return true
    end

    # Validates file existence
    def validate_file_existence(_accessor)
      accessor = get_accessor(_accessor)

      return false if File.exists? accessor

      return true
    end

    # Return the calue of an accessor member
    def get_accessor(accessor)
      self.send accessor
    end

    # Return if a entity is valid
    def valid?
      self.validators
      @validation_messages ||= []

      @validators.each do |key, value|
        @validators[key].each do |attribute, status|
          if status == false
            @validation_status = false
            @validation_messages << attribute.to_s + " #{I18n['validation'][key.to_s]}"
          end
        end
      end

      status = @validation_status.nil? ? true : @validation_status

      return status
    end

  end
end
