require_relative 'env'

# def view2
#   JSON.parse File.read "old_app.json"
# end

# TODO: freeze constants - View.freeze etc - add ruby magic commend and runner (+docker container) to run with frozen strings / frozen variables

# View = {
#
#   header: { title: "SampleApp" },
#
# }


module Jason
  jason = ""

  jason = {
    head: {
      title: "SampleApp"
    }.merge(Head)
  }

  jason.merge!(
    body: View
  ) if defined?(View)

  Jason = jason
end


# freeze


class App < Roda
  plugin :json

  include Jason

  route do |r|
    @rand = rand 10**10
    # just a json root
    #
    r.root {

      # to_json({
      {
        "$jason": Jason
      # })
      }

    }

    r.on(":app") {
      r.get {
        r.is {
          {
            "$jason": Jason
          }
        }
      }
    }


    # r.get("image1") {
    #   response["content-type"] = "image/jpeg"
    #   api_key = "AIzaSyDDS8H3WiuXrlxLNVroLxYBIF8XZ1trm4s"
    #   resp = Net::HTTP.get_response URI "https://maps.googleap2.jpgis.com/maps/api/staticmap?center=Brooklyn+Bridge,New+York,NY&zoom=13&size=600x300&maptype=roadmap
    #   &markers=color:blue%7Clabel:S%7C40.702147,-74.015794&key=#{api_key}&a=a.jpg"
    #   resp.body
    # }


    # use roda to generate your json-based-app
    #
    # r.root {
    #   r.redirect "/foos"
    # }
    #
    # r.on("foos") {
    #   # @things = '"foo1", "foo2"'            # #1 - as string
    #   @things = to_json [:foo1, :foo2, :foo3] # #2 - json of a ruby object
    #
    #   r.get("browse") { # url: /foos/browse (on "foos" - on/get "browse" - #roda)
    #     # "[foos, #{@things}]"   # array (manual: prepending an item) - #1
    #     # "{foos: [#{@things}]]" # hash                               - #1
    #
    #     @things                  # array (json) - #2
    #   }
    #
    #   # r.post # respond to an user action
    # }
  end
end
