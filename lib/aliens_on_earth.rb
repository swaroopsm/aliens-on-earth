# Require third-party libraries
require 'erb'
require 'fileutils'
require 'securerandom'
require 'prawn'

# Require app files
require_relative 'aliens_on_earth/living_being'
require_relative 'aliens_on_earth/human'
require_relative 'aliens_on_earth/alien'
require_relative 'aliens_on_earth/renderer'
require_relative 'aliens_on_earth/renderers/base'
require_relative 'aliens_on_earth/renderers/text'
require_relative 'aliens_on_earth/renderers/pdf'
require_relative 'aliens_on_earth/commander'
require_relative 'aliens_on_earth/formatter'
