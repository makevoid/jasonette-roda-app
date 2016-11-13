require_relative 'env'

# old stuff:
#
# module Jason; end
# require_relative 'jason'

# def view2
#   JSON.parse File.read "old_app.json"
# end

# TODO: freeze constants - View.freeze etc - add ruby magic commend and runner (+docker container) to run with frozen strings / frozen variables

# View = {
#
#   header: { title: "SampleApp" },
#
# }



# -----------

# app_name = "camera"

# require_relative "sample_apps/#{app_name}"



# -----------

# freeze

# external app loading
#
def AppFn(app_name)
  # TODO: pre-require them all but trigger / include the code only if that specific route is executed

  begin
    require_relative "sample_apps/#{app_name}"
  rescue Exception => e
    # TODO: read all the apps
    # app_names = Dir.glob("sample_apps/*.rb").map{File.basename...}).join(", ")
    raise e.class, "App Errored during Require - app_name: #{app_name} - error: #{e.message} - stacktrace: \n#{e.backtrace.join("\n")}" # "...- #{app_names}"  # better error
  end

  app_name = app_name.capitalize # camelize just 1 word names
  app_name = Inflecto.camelize app_name # camelizes correctly - requires inflecto - an external dependency (gem)
  # raise "SampleAppNotFoundError - Error - App Name: '#{app_name}' not found in `sample_apps` directory" unless Module.const_defined? app_name.to_sym
  # raise app_name.inspect

  jasonApp = Kernel.const_get app_name

  Kernel.const_set "JasonApp", jasonApp

  JasonApp
end


class App < Roda
  plugin :json

  # include Jason

  route do |r|
    @rand = rand 10**10
    # just a json root
    #
    r.root {

      # # to_json({
      # {
      #   "$jason": Jason
      # # })
      # }

      # TODO: comment these - these are not commented for testing purposes
      #
      # r.proxy "/apps/camera" - a "clientside proxy" - AppFn #logicalCode
      Jason = AppFn "camera" # returns a jason JSON app
      Jason = AppFn "chat"
      # done
      Jason = AppFn "hello_world"
      Jason = AppFn "hello_world_refresh"
      Jason = AppFn "hello_image"
      # Jason = AppFn "op_return_contract"
      Jason = AppFn "op_return_contract_marriage"
      {
        "$jason": Jason
      # })
      }
    }

    r.on("apps") {

      r.on(":app_name") { |app_name|
        # TODO: pre-require them all but trigger / include the code only if that specific route is executed
        require_relative "sample_apps/#{app_name}"

        Kernel.const_set "JasonApp", Kernel.const_get(app_name.capitalize) # simple version

        # ---------------------------

        # --- sample_apps ---

        # ---------------------------

        # chat

        # ---------------------------

        # camera

        # ---------------------------

        # weather

        # ---------------------------

        # map

        # ---------------------------

        # list view

        # ---------------------------

        # tabbed app

        # ---------------------------

        # fullscreen app

        # ---------------------------

        # op_return_contract

        # ---------------------------


        r.get {
          r.is {
            {
              "$jason": JasonApp
            }
          }
        }
      }
    }


    APP_ENV = "development"
    if APP_ENV == "development"

      r.on("dev") {
        r.on("cache") {
          r.get("clear") {
            # clears redis cache
            R.flushdb #!
            { success: true }
          }
        }
      }

    end

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
