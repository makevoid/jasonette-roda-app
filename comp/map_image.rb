# GMAPS_STATIC_KEY = ""
# TODO: load from json config





center1 = "Brooklyn+Bridge,New+York,NY"
center2 = "London+Bridge,London,UK"


size = "1500x600"

maptype = "roadmap"
maptype = "satellite"











marker1 = "color:blue%7Clabel:S%7C40.702147,-74.015794&markers=color:green%7Clabel:G%7C40.711614,-74.012318"

marker2 = "color:red%7Clabel:C%7C40.718217,-73.998284"












url = "https://maps.googleapis.com/maps/api/staticmap?center=#{center1}&zoom=13&size=#{size}&maptype=#{maptype}
&markers=#{marker1}
&markers=#{marker2}
&key=#{GMAPS_STATIC_KEY}"

puts url
