module AliensOnEarth
  module Helpers
    module ViewHelper

      def render_partial(template, data={})
        template_contents = File.read File.join(File.expand_path("../../../../views", __FILE__), 'partials', template + '.erb')

        puts ERB.new(template_contents).result(binding)
      end

    end
  end
end
