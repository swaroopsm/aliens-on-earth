module AliensOnEarth
  module Renderers

    class Pdf < Base

      def initialize
        @dirname = 'pdf'
        @extension = '.pdf'
        self.create_dir
      end

      def render
        @template = template_path('prawn')
        @pdf = Prawn::Document.new
        self.instance_eval File.read(@template)
      end

      def export
        self.render
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
