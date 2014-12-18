module AliensOnEarth
  module Utilities

    def to_class(str)
      return str.split("_").map{ |split| split.capitalize }.join
    end

    def humanize_renderer(str)
       str.split("_").map{ |split| split.capitalize }[0...-1].join(" ")
    end

  end
end
