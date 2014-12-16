module AliensOnEarth
  class Formatter

    TEXT_CONST = 'txt'
    TEXT_ID = '1'

    PDF_CONST = 'pdf'
    PDF_ID = '2'

    class << self

      def text?(format)
        check_format(format, TEXT_ID, TEXT_CONST)
      end

      def pdf?(format)
        check_format(format, PDF_ID, PDF_CONST)
      end

      def check_format(format, x, y)
        format.to_s == x or format.to_s == y
      end

    end

  end
end
