module AliensOnEarth
  class Formatter

    # *_CONST indicates a name for a particular format
    # *_ID indicates an id for a particular format

    TEXT_CONST = 'txt'
    TEXT_ID = '1'

    PDF_CONST = 'pdf'
    PDF_ID = '2'

    class << self

      # Check whether the requested formatter is of txt
      def text?(format)
        check_format(format, TEXT_ID, TEXT_CONST)
      end

      # Check whether the requested formatter is of pdf
      def pdf?(format)
        check_format(format, PDF_ID, PDF_CONST)
      end

      # Validate a format
      def check_format(format, x, y)
        format.to_s == x or format.to_s == y
      end

    end

  end
end
