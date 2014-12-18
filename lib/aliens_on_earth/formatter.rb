module AliensOnEarth
  # Register all renderers here
  class Formatter

    extend Utilities

    class << self

      def all
        renderers = {}

        Dir.glob(File.expand_path("../renderers/*", __FILE__)).each_with_index do |renderer, index|
          basename = File.basename renderer, '.rb'
          key = (index+1).to_s
          renderers[key] = {
            :basename => basename,
            :classname => Formatter.to_class(basename),
            :title => Formatter.humanize_renderer(basename)
          }
        end

        renderers
      end

    end

  end
end
