module AliensOnEarth

  # Register all renderer engines here
  class Renderer

    def initialize(format)
      @format = format
    end

    def engine
      if Formatter.text? @format
        return Renderers::Text.new
      elsif Formatter.pdf? @format
        return Renderers::Pdf.new
      else
        return Renderers::Text.new
      end
    end

  end
end
