# GMAPS_STATIC_KEY = ""
# TODO: load from json config


center = "51.504855,-0.019441" # One Canada Square

markers = if enable_markers
  [
    { coords: "40.702147,-74.015794", color: "lightblue1" }
    { coords: "40.711614,-74.012318", color: "lightblue2" }
  ]
end

url = "http://staticmap.openstreetmap.de/staticmap.php?center=#{center}&zoom=12&size=865x512&maptype=mapnik&markers=#{markers}
"

puts url

# component

comp = {
  type: "image",
  url:  url,
}


# notes:

# gmaps (requires api token - not the best map to demo) - api key registration: https://developers.google.com/maps/documentation/static-maps/get-api-key
# "https://maps.googleapis.com/maps/api/staticmap?center=#{center1}&zoom=13&size=#{size}&maptype=#{maptype}
# &markers=#{marker1}
# &markers=#{marker2}
# &key=#{GMAPS_STATIC_KEY}"
