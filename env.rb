require 'bundler'
Bundler.require :default

require 'json'
# Oj.default_options = { mode: :compat }

require_relative 'lib/jsonify'
# include Jsonify



require_relative 'styles'


# temporary scripts to support data of the temporary components
`echo "xxx" > test.txt` # images conf


# require main components here (note: order is relevant)

require_relative 'comp/hero'
require_relative 'comp/tabbed_layout'

# ...



# main view

require_relative 'view'
