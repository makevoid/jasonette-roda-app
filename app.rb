require_relative 'env'

class App < Roda
  route do |r|
    r.root {
      r.redirect "/foos"
    }

    r.on("foos") {
      # @things = '"foo1", "foo2"'            # #1 - as string
      @things = to_json [:foo1, :foo2, :foo3] # #2 - json of a ruby object

      r.get("browse") { # url: /foos/browse (on "foos" - on/get "browse" - #roda)
        # "[foos, #{@things}]"   # array (manual: prepending an item) - #1
        # "{foos: [#{@things}]]" # hash                               - #1

        @things                  # array (json) - #2
      }

      # r.post # respond to an user action
    }
  end
end
