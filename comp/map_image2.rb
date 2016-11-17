# GMAPS_STATIC_KEY = "" # TODO: load from config - same key - main.json config file



point1 = "Brooklyn+Bridge,New+York,NY"
point2 = "London+Bridge,London,UK"


size = "1500x600"

maptype = "roadmap"
# maptype = "satellite"



marker1 = "color:blue%7Clabel:S%7C40.702147,-74.015794&markers=color:green%7Clabel:G%7C40.711614,-74.012318"

marker2 = "color:red%7Clabel:C%7C40.718217,-73.998284"



# url1 = "https://maps.googleapis.com/maps/api/staticmap?center=#{point}&zoom=13&size=#{size}&maptype=#{maptype}&markers=#{marker1}&markers=#{marker2}&key=#{GMAPS_STATIC_KEY}"


# url2 = "https://maps.googleapis.com/maps/api/staticmap?center=#{point1}&zoom=13&size=#{size}&maptype=#{maptype}
# &markers=#{marker1}
# &markers=#{marker2}
# &key=#{GMAPS_STATIC_KEY}"

puts url1

# html image

# <img src="url">
#
#
#
# # jasonette image (JSON)
#
#
# {
#   type: "image";
#   url: "mkvd.eu.ngrok.io/jasonette-image.jpg"
# }
