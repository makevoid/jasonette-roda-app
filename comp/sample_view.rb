# TODO: make local

# imgDataAddr = "http://localhost:3002/image1"

api_key = "AIzaSyDDS8H3WiuXrlxLNVroLxYBIF8XZ1trm4s" # google maps static api key

imgDataAddr = "http://maps.googleapis.com/maps/api/staticmap?center=NY&zoom=13&size=700x350&maptype=roadmap&markers=color:blue%7Clabel:S%7C40.702147,-74.015794&key=#{api_key}&a=a.jpg"

imgDataAddr2 = "http://maps.googleapis.com/maps/api/staticmap?center=NY&zoom=9&size=700x350&maptype=roadmap&markers=color:blue%7Clabel:S%7C40.702147,-74.015794&key=#{api_key}&a=a.jpg"

# imgDataAddr = "https://s-media-cache-ak0.pinimg.com/236x/76/61/8d/76618d35a6820a8a83e09dc1b0bd5333.jpg"


address = "ny ny!"

imgDataKey = imgDataAddr2



# ---------------------------------------------------------------

View = {

  header: { title: "SampleApp", style: { shy: true } },

  sections: [
    {
      items: [
        {
          type: "button",
          text: "reloadd",
          style: {
            background: "#f4bb00",
            size: "24"
          },
          action: {
            type: "$reload"
          }
        },
        {
          type: "label",
          text: "Address"
        }, {
          type: "image",
          url:  imgDataAddr
        }, {
          type: "label",
          text: address
        }, {
          type: "label",
          text: "Private Key"
        }, {
          type: "image",
          url:  imgDataKey
        }, {
          type: "label",
          text: "Built with Jasonette and Runkit - @makevoid"
        }
      ]
    }
  ]

}
