# Aliens On Earth

[![Build Status](https://travis-ci.org/swaroopsm/aliens-on-earth.svg?branch=master)](https://travis-ci.org/swaroopsm/aliens-on-earth)
[![Code Climate](https://codeclimate.com/github/swaroopsm/aliens-on-earth/badges/gpa.svg)](https://codeclimate.com/github/swaroopsm/aliens-on-earth)
[![Coverage Status](https://coveralls.io/repos/swaroopsm/aliens-on-earth/badge.png?branch=master)](https://coveralls.io/r/swaroopsm/aliens-on-earth?branch=master)

This is a task / problem given by Multunus Software.

A treaty of friendship has been signed between Aliens and Humans. The aliens are now welcome on Earth and can stay as long as they wish with the Humans. You are the person responsible to register the aliens.

A console based application that accepts alien details like Code Name, Blood Color, No.of Antennas, No. of Legs and Home Planet and then export these details into one of the 2 formats, depending on user's choice - "plain text" or "PDF".

## How to run
Clone the repository
~~~
$ git clone git@github.com:swaroopsm/aliens-on-earth.git
~~~

Install gems
~~~
$ bundle
~~~

Run the application and answer the questions prompted that will be prompted
~~~
$ ./bin/app
~~~

## Adding a new export formatter / renderer
In order to add a new export format do the following:
- Create a file called `<format>_renderer.rb` in `lib/aliens_on_earth/renderers/`
- Setup the `DIRNAME` and `EXTENSION` respectively
- Create a template in `views/templates/renderers/<DIRNAME>/alien.erb`. Here `@data` is availabe with all the data stuffs
- Run `bin/app` and this would automatically show up the newly created export formatter.

## Running tests
~~~
$ bundle exec rspec
~~~

## Directory Structure
~~~
bin
  - app # the main app binary
config
  - i18n.yml # i18n messages for validation etc.
lib # core library files
  - aliens_on_earth
  - aliens_on_earth.rb
spec # all tests
views
  - partials # view partials
  - renderers # templates for renderer engines
~~~
