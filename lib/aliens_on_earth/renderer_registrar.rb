module AliensOnEarth

  # Create and return the right renderer engine
  class RendererRegistrar

    include Utilities

    def initialize(format)
      @format = format
    end

    def engine
      begin 
        return Object.const_get("AliensOnEarth::Renderers::" + @format[:classname]).new
      rescue Exception => e
        return Renderers::TextRenderer.new
      end
    end

  end
end
