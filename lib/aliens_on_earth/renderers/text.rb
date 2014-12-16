module AliensOnEarth
  module Renderers

    class Text < Base

      DIRNAME = 'text'
      EXTENSION = '.txt'

      def initialize
        @dirname = DIRNAME
        @extension = EXTENSION

        super
      end

      def render
        @template = template_path('erb')
        @contents = erb.result(binding)
      end
      
    end

  end
end
