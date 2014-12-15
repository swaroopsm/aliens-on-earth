module AliensOnEarth
  module Renderers

    class Base

      attr_accessor :dirname

      def initialize
        create_dir
      end

      def get_path
        File.expand_path('../../../../data', __FILE__)
      end

      def create_dir
        FileUtils.mkdir File.join(get_path, @dirname)
      end

    end

  end
end
