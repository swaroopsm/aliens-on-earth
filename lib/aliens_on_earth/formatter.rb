module AliensOnEarth
  class Formatter

    TEXT = 'txt'
    TEXT_CONST = '1'

    PDF = 'pdf'
    PDF_CONST = '2'

    class << self

      def text?(format)
        check_format(format, TEXT, TEXT_CONST)
      end

      def pdf?(format)
        check_format(format, PDF, PDF_CONST)
      end

      def check_format(format, x, y)
        format == x or format == y
      end

    end

  end
end
