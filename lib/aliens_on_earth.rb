# Require third-party libraries
require 'erb'
require 'fileutils'
require 'securerandom'
require 'prawn'
require 'yaml'

# Require app files
require_relative 'aliens_on_earth/validator'
require_relative 'aliens_on_earth/helpers/view_helper'
require_relative 'aliens_on_earth/living_being'
require_relative 'aliens_on_earth/human'
require_relative 'aliens_on_earth/alien'
require_relative 'aliens_on_earth/renderer'
require_relative 'aliens_on_earth/renderers/base'
require_relative 'aliens_on_earth/renderers/text'
require_relative 'aliens_on_earth/renderers/pdf'
require_relative 'aliens_on_earth/commander'
require_relative 'aliens_on_earth/formatter'

module AliensOnEarth

  # Defaulting to english for the temporarily
  I18n = YAML.load_file(File.expand_path('../../config/i18n.yml', __FILE__))['en']
end
