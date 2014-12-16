module AliensOnEarth
  module Renderers

    class Base

      attr_accessor :dirname, :extension, :template, :data, :contents, :placeholder, :export_filename

      DEFAULT_STORAGE_PATH = File.expand_path('../../../../data', __FILE__)

      def create_storage_dir
        placeholder = @placeholder || @dirname
        dirpath = File.join(self.class.storage_path, placeholder)
        FileUtils.mkdir dirpath unless Dir.exists? dirpath
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
        File.join(self.class.storage_path, @placeholder, @export_filename + @extension)
      end

      class << self
        
        def storage_path=(path)
          @@storage_path = path
        end

        def storage_path
          @@storage_path || DEFAULT_STORAGE_PATH
        end

      end

    end

  end
end
