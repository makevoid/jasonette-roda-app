# sample map data (center + pins)

# this is your map center

map_center = { lat: 40.7197614, lng: -73.9909211 }

# these are your map pins

map_pins   = [
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

# ---------------------------------------

Map(
  center: map_center,
  pins:   map_pins
)



# data format (placeholders)

# center: {
#   lat: "",
#   lng: "",
# }
#
# pins: [
#   pin: ...
# ]
#
# pin: {
#   title: "",
#   desc:  "",
#   coord: {
#     lat: "",
#     lng: "",
#   }
# }
