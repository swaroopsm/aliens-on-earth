module AliensOnEarth
  module Renderers

    class Text < Base

      DIRNAME = 'text'
      EXTENSION = '.txt'

      def initialize
        @dirname = DIRNAME
        @extension = EXTENSION
        self.create_dir
      end

      def render
        @template = template_path('erb')
        @contents = erb.result(binding)
      end
      
    end

  end
end
