module AliensOnEarth
  module Renderers

    class Text < Base

      DIRNAME = 'text'
      EXTENSION = '.txt'

      def initialize
        @dirname = DIRNAME
        @extension = EXTENSION
      end

      def render
        self.create_storage_dir()
        @template = template_path('erb')
        @contents = erb.result(binding)
      end
      
    end

  end
end
