module AliensOnEarth
  module Renderers

    class Base

      attr_accessor :dirname, :extension, :template, :data, :contents, :placeholder, :export_filename

      def initialize
        create_dir
      end

      def storage_path
        File.expand_path('../../../../data', __FILE__)
      end

      def create_dir
        dirpath = File.join(storage_path, @dirname)
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
        File.write(storage_filename, @contents)
      end

      def template_path(extension)
        File.expand_path('../../renderers/templates/' + @dirname + '/' + @placeholder + '.' + extension, __FILE__)
      end

      def storage_filename
        File.join(storage_path, @dirname, @export_filename + @extension)
      end

    end

  end
end
