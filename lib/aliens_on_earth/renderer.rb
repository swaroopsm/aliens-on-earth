module AliensOnEarth

  # Register all renderer engines here
  class Renderer

    TEXT = 'txt'
    TEXT_CONST = '1'

    PDF = 'pdf'
    PDF_CONST = '2'

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
