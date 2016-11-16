# doc: https://jasonette.github.io/documentation/components/#map

def map_point(point)
  "#{point.fetch :lat}, #{point.fetch :lng}"
end

def MapPinTemplate(title:, coord:, selected: false, description: "")
  {
    title:title,
    description: description,
    coord: map_point(coord),
    style: {
      selected: (!!selected).inspect,
    },
  }
end

def render_pins(pins)
  pins.map do |pin|
    MapPinTemplate(
      title:        pin.fetch(:title),
      coord:        pin.fetch(:coord),
      selected:     pin[:selected],
      description:  pin[:description] || "",
    )
  end
end


def Map(center:, pins:, map_type: "satellite_flyover") # satellite is jasonette's default - see https://jasonette.github.io/documentation/components/#map  for more info

  {
    type: "map",
    region: {
      coord: map_point(center),
      width: "100",
      height: "100"
    },
    pins: render_pins(pins),
    style: {
      width:  "100%",
      height: "700",
      type:   map_type
    }
  }

end
