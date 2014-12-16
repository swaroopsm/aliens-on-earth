module AliensOnEarth
  module Renderers

    # Abstract class for all renderer engines
    class Base

      attr_accessor :dirname, :extension, :template, :data, :contents, :placeholder, :export_filename

      DEFAULT_STORAGE_PATH = File.expand_path('../../../../data', __FILE__)

      # Create directory where an placeholder / entity files will exported to
      def create_storage_dir
        placeholder = @placeholder || @dirname
        dirpath = File.join(self.class.storage_path, placeholder)
        FileUtils.mkdir dirpath unless Dir.exists? dirpath
      end

      # The erb object
      def erb
        template_contents = File.read(@template)
        ERB.new(template_contents)
      end

      # Common export method if renderred using templates
      def export
        self.render()
        File.write(storage_filename, @contents)
      end

      # Path of the template in use
      def template_path(extension)
        File.expand_path('../../renderers/templates/' + @dirname + '/' + @placeholder + '.' + extension, __FILE__)
      end

      # Name of the export file
      def storage_filename
        File.join(self.class.storage_path, @placeholder, @export_filename + @extension)
      end

      class << self
        
        # Base storage path for all the exported files
        def storage_path=(path)
          @@storage_path = path
        end

        # Return the base storage path
        def storage_path
          @@storage_path || DEFAULT_STORAGE_PATH
        end

      end

    end

  end
end
