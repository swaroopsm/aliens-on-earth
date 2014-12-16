module AliensOnEarth

  # Register all renderer engines here
  class Renderer

    TEXT = 'txt'
    PDF = 'pdf'

    def initialize(format)
      @format = format
    end

    def engine
      case @format
      when TEXT
        return Renderers::Text.new
      when PDF
        return Renderers::Pdf.new
      else
        return Renderers::Text.new
      end
    end

  end
end
