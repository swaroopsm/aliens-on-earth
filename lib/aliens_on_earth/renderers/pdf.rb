module AliensOnEarth
  module Renderers

    # Renderer responsible for renderring PDF files using PrawnPDF. Inherits from Base Renderer.
    class Pdf < Base

      DIRNAME = 'pdf'
      EXTENSION = '.pdf'

      def initialize
        @dirname = DIRNAME
        @extension = EXTENSION
        @pdf = Prawn::Document.new
      end

      # Compile and render contents from template
      def render
        @template = template_path('prawn')
        self.instance_eval File.read(@template)
      end

      # Export contents to a pdf file
      def export
        begin
          self.create_storage_dir()
          self.render()
          @pdf.render_file storage_filename if valid?
        rescue Exception => e
          raise e.message
        end
      end

      # PDF helper methods

      # Equivalent to prawn pdf text
      def text(*args)
        @pdf.text *args
      end

      # Equivalent to prawn pdf stroke horizontal rule
      def stroke_horizontal_rule
        @pdf.stroke_horizontal_rule
      end

      # Equivalent to prawn pdf define_grid
      def define_grid(*args)
        @pdf.define_grid(*args)
      end

      # Equivalent to prawn pdf grid
      def grid(x, y)
        @pdf.grid(x, y)
      end

    end

  end
end
