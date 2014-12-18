module AliensOnEarth
  module Utilities

    # Return a string that is classized
    # Eg.: text_renderer => TextRenderer
    def to_class(str)
      return str.split("_").map{ |split| split.capitalize }.join
    end

    # Return a string that is humanized renderer
    # Eg.: text_renderer => Text
    def humanize_renderer(str)
       str.split("_").map{ |split| split.capitalize }[0...-1].join(" ")
    end

  end
end
