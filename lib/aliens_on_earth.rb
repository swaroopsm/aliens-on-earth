# Require third-party libraries
require 'erb'
require 'fileutils'
require 'securerandom'
require 'prawn'
require 'yaml'

# Require app files
require_relative 'aliens_on_earth/validator'
require_relative 'aliens_on_earth/utilities'
require_relative 'aliens_on_earth/helpers/view_helper'
require_relative 'aliens_on_earth/living_being'
require_relative 'aliens_on_earth/human'
require_relative 'aliens_on_earth/alien'
require_relative 'aliens_on_earth/renderer_registrar'
require_relative 'aliens_on_earth/base_renderer'
require_relative 'aliens_on_earth/commander'
require_relative 'aliens_on_earth/formatter'

# Require all renderers here
Dir.glob(File.expand_path('../aliens_on_earth/renderers/*', __FILE__)).each do |renderer|
  require renderer
end

module AliensOnEarth

  # Defaulting to english for the temporarily
  DEFAULT_I18N_LANG = 'en'

  I18n = YAML.load_file(File.expand_path('../../config/i18n.yml', __FILE__))[DEFAULT_I18N_LANG]

end
