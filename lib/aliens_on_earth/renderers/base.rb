module AliensOnEarth
  module Renderers

    # Abstract class for all renderer engines
    class Base

      include Validator
      include Helpers::ViewHelper

      attr_accessor :dirname, :extension, :template, :data, :contents, :placeholder, :export_filename

      DEFAULT_STORAGE_PATH = File.expand_path('../../../../data', __FILE__)

      # Create directory where an placeholder / entity files will exported to
      def create_storage_dir
        placeholder = @placeholder || @dirname
        dirpath = File.join(storage_path, placeholder)
        FileUtils.mkdir dirpath unless Dir.exists? dirpath
      end

      def storage_path
        self.class.storage_path
      end

      # The erb object
      def erb
        template_contents = File.read(@template)
        ERB.new(template_contents)
      end

      # Common export method if renderred using templates
      def export
        begin
          self.render()
          if valid?
            File.write(storage_filename, @contents)
          else
            render_partial 'validation_errors', { :errors => @validation_messages }
          end
        rescue Exception => e
          puts "Exception: #{e.message}"
        end
      end

      # Path of the template in use
      def template_path(extension)
        File.expand_path('../../../../views/renderers/' + @dirname + '/' + @placeholder + '.' + extension, __FILE__)
      end

      # Name of the export file
      def storage_filename
        File.join(storage_path, @placeholder, @export_filename + @extension)
      end

      def validators
        validate :file_existence, :storage_filename
      end

      class << self
        
        # Base storage path for all the exported files
        def storage_path=(path)
          @@storage_path = path
        end

        def storage_path
          @@storage_path ||= DEFAULT_STORAGE_PATH

          @@storage_path
        end

      end

    end

  end
end
