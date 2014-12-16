module AliensOnEarth
  module Renderers

    class Pdf < Base

      DIRNAME = 'pdf'
      EXTENSION = '.pdf'

      def initialize
        @dirname = DIRNAME
        @extension = EXTENSION
        @pdf = Prawn::Document.new
      end

      def render
        @template = template_path('prawn')
        self.instance_eval File.read(@template)
      end

      def export
        self.create_storage_dir()
        self.render()
        @pdf.render_file storage_filename
      end

      # PDF helper methods
      def text(*args)
        @pdf.text *args
      end

      def stroke_horizontal_rule
        @pdf.stroke_horizontal_rule
      end

      def define_grid(*args)
        @pdf.define_grid(*args)
      end

      def grid(x, y)
        @pdf.grid(x, y)
      end

    end

  end
end
