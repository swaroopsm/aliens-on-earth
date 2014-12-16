module AliensOnEarth
  module Renderers

    # Renderer responsible for rendering contents in text format. Inherits from Base Renderer
    class Text < Base

      DIRNAME = 'text'
      EXTENSION = '.txt'

      def initialize
        @dirname = DIRNAME
        @extension = EXTENSION
      end

      # Compile and render contents from template
      def render
        self.create_storage_dir()
        @template = template_path('erb')
        @contents = erb.result(binding)
      end
      
    end

  end
end
