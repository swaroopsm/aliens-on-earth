module AliensOnEarth
  module Renderers

    class Base

      attr_accessor :dirname, :extension, :template, :data, :contents, :placeholder, :export_filename

      def initialize
        create_dir
      end

      def get_path
        File.expand_path('../../../../data', __FILE__)
      end

      def create_dir
        dirpath = File.join(get_path, @dirname)
        FileUtils.mkdir dirpath unless Dir.exists? dirpath
      end

      def generate_filename

      end

      def erb
        template_contents = File.read(@template)
        ERB.new(template_contents)
      end

      def export
        self.render()
        filename = File.join(get_path, @dirname, @export_filename + @extension)
        File.write(filename, @contents)
      end

      def template_path(extension)
        File.expand_path('../../renderers/templates/' + @dirname + '/' + @placeholder + '.' + extension, __FILE__)
      end

    end

  end
end
