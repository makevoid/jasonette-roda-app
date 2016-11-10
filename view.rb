# ---------------------------------------------------------------

imgDataAddr = "https://maps.googleapis.com/maps/api/staticmap?center=Brooklyn+Bridge,New+York,NY&zoom=13&size=600x300&maptype=roadmap
&markers=color:blue%7Clabel:S%7C40.702147,-74.015794"

address = "ny ny!"

imgDataKey = imgDataAddr



# ---------------------------------------------------------------

View = {

  header: { title: "SampleApp", style: { shy: true } },

  sections: [
    {
      items: [
        {
          type: "label",
          text: "Address"
        }, {
          type:"image",
          url: imgDataAddr
        }, {
          type: "label",
          text: address
        }, {
          type: "label",
          text: "Private Key"
        }, {
          type:"image",
          url: imgDataKey
        }, {
          type: "label",
          text: "Built with Jasonette and Runkit - @makevoid"
        }
      ]
    }
  ]

}


# View next
#
# :ruby
#   imgDataAddr = "http://"
#   mapAddr     = "http://"
#   # imgDataAddr = "base64"
#   # imgDataKey  = QrCode.make private_key
#
# %header{ title: "SampleApp", style: { shy: true } }
# %sections
#   %items
#     # - for item in section.items
#     %label "Address"
#     %img{ url: imgDataAddr }
#
#
#     %label "Address (static map with link)"
#     %a{ href: "" }
#       %img{ url: mapAddr }
#
#
# etc...
#
#   {type: "label", text: "Private Key"},
#   {type:"image",  url: imgDataKey},
