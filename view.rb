# THIS IS SPARTA!

# this file has been deprecated - remove used code (libs) from it and drop the rest

# this file has not been cleaned up at all -- sorry!




# main view and main app data


# this is just an url (container) example - just an hash, key, value ... useful to name links (link id - #shortUrls)
URLS = {
  home:    "https://raw.githubusercontent.com/Jasonette/Twitter-UI-example/master/home.json",
  screen1: "https://raw.githubusercontent.com/Jasonette/Twitter-UI-example/master/home.json",
}

Title = "Componentized Jasonette App"


# Sample Components
# -------------

# hero view
#
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
    items: Items
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

# Head = {
#   description: "Tap to open up camera",
#   actions: {
#     "$load": {
#       type: "$media.camera",
#       options: {
#         edit: "true",
#         type: "video"
#       },
#       success: {
#         type: "$render"
#       }
#     }
#   }
# }
#
# Head = {} if NO_HEAD

# ----------------

# View

# SimpleLayout / RefreshLayout / DevLayout


def RefreshLayout(elements)
  items = [
      {
          type: "label",
          text: "Refresh",
          action: {
              type: "$reload"
          }
      },
      # {
      #     type: "label",
      #     text: "another label..."
      # }
  ]

  # elements for content get added to 'items' here
  items += elements

  {
    header: {
     title: "Componentized Jasonette App",
     style: {
       shy: true
     }
    },
    sections: [
     {
       items: items
     }
    ]
  }
end

# SimpleLayout = RefreshLayout
# DevLayout    = RefreshLayout


# OPReturnView
#
# -------

require_relative 'lib/op_return'

# config

address = "1FVfHt4erqCtroBaDyVc9rAsyYAdheF4tF" # simple jsons
# address = "12RXhCqxnXgJyfJLL2mvcqT3jCQ2o6rMAR" # marriage certificate
# address = "1..." # ownership certificate (car) #sample1

# ------

# owner_prev:
# owner_next:

# input owner -> output owner

# IMPORTANT

# EXAMPLE BITCOIN OP RETURN CONTRACTS (certificates + address details / script)

# they probably still require a legal agreement ( email / PDF over email / PDF + torrent hash / ipfs hash ) - see imogelius

# -----

{ car_brand: "", car_make: "", year: "", license_plate_number: "", software_version: "", software_uuid: "" }

# -----

address = "1..." # ownership certificate (boat) #sample2

{ brand: "", make: "", year:"", radio_id: "" }

# -----

address = "1..." # ownership certificate (house) #sample3

{ mq: "", floors: "", gps_coords_center: "", gps_coords_polygon: "" }

# -----

# address = "1..." # incorporation certificate (company) #sample4

{ founder_1: "",  founder_2: "", founder_3: "", address: "" }

# -----

# address = "1..." # employment contract #sample5

{ employer_company_id: "", employee_eid: "" }

# -----


# address = "1..." # license plate registration (car/motorbike) #sample6

{ license_plate_number: "", rider_eid: "" }


# address = "1..." # student degree #sample7

{ student_eid: "", student_uni_id: "", univeristy: "" }


# address = "1..." #


# components

def OPRLabel(text:)
  {
    type: "label",
    text: text
  }
end

def OPReturnView(op_returns)
  view = []
  op_returns.each do |op_return|
    view << OPRLabel(text: op_return)
  end
  view
end


# standard Label

def Label(text, options: {})
  {
    type: "label",
    text: text
  }.merge(options)
end
