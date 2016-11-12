require_relative "map"

# sample map data (center + pins)

# MapSampleElements = {}
# MSE = MapSampleElements
MSE = {}

# this is your map center

MSE[:map_center] = { lat: 40.7197614, lng: -73.9909211 }

# these are your map pins

MSE[:map_pins]   = [
  {
    title: "This is a pin",
    coord: { lat: 40.7197614, lng: -73.9909211 }
  },
  {
    title: "This is a pin",
    description: "It really is.",
    coord: { lat: 40.6197614, lng: -73.8909211 },
    selected: true
  },
]

# this is the map component, feeded with the datas (bonus exercise: make the data come from an external api)

def MapSample
  Map(
    center: MSE[:map_center],
    pins:   MSE[:map_pins]
  )
end
