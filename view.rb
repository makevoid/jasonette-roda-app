# main view and main app data

URLS = {
  home:    "https://raw.githubusercontent.com/Jasonette/Twitter-UI-example/master/home.json",
  screen1: "https://raw.githubusercontent.com/Jasonette/Twitter-UI-example/master/home.json",
}

Title = "Componentized Jasonette App"


# hero view

Body = Hero(
  title: Title,
  text:  "Template generated via Ruby Components",
)

# map view

# require_relative 'comp/map_sample'
# Body = MapSample()


# image view

require_relative 'comp/s3_images'
Body = S3ImagesView

# Container = {
#   type: "label",
#   text: "Refresh",
#   action: {
#     type: "$reload",
#   },
# }

action_reload = {
  type: "$reload"
}

# local
#
# octocat_image_url = File.read "./img/octocat_daft_punk_cc_github_inc.gif"

# from the interwebs (result from google search)
#
octocat_image_url =
"http://31.media.tumblr.com/17fea920ff36ef4f5b877d5216a7aad9/tumblr_mo9xje8zZ41qcbiufo1_1280.gif"


Items = [
  {
    type:   "label",
    text:   "Refresh",
    action: action_reload
  }, {
    type: "label",
    text: "Test = #{@rand}",
  },
]

# (1..20).each do |i|
#   image_url =  S3Images.sample
#   image = {
#     type: "image",
#     url:  image_url,
#   }
#   Items.push image
# end

require_relative "comp/map_sample"
Items.push MapSample()

Container = {
  header: {
    title: "Componentized Jasonette App",
    style: {
      shy: true,
    },
  },
  sections: [{
    "items": Items
  }]
}

NO_HEAD = true # don't include a head component

View = Container

# tabbed layout
#
# View = TabbedLayout(
#   title: Title,
#   body:  Body,
# )

Head = {
  description: "Tap to open up camera",
  actions: {
    "$load": {
      type: "$media.camera",
      options: {
        edit: "true",
        type: "video"
      },
      success: {
        type: "$render"
      }
    }
  }
}

Head = {} if NO_HEAD

# View
