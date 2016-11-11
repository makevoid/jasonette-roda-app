
def map_point(point)
  "#{point.fetch :lat}, #{point.fetch :lng}"
end

def MapPinTemplate(title:, coord:, selected: false, description: "")
  {
    title: "This is a pin",
    description: "It really is.",
    coord: map_point(coord),
    style: {
      selected: "true",
    },
  }
end

def render_pins(pins)
  pins.map do |pin|
    MapPinTemplate(
      title:        pin.fetch(:title),
      coord:        pin.fetch(:coord),
      selected:     pin[:selected],
      description:  pin[:description],
    )
  end
end


def Map(center:, pins:)

  {
    type: "map",
    region: {
      coord: map_point(center),
      width: "100",
      height: "100"
    },
    pins: render_pins(pins),
    style: {
      width: "100%",
      height: "400"
    }
  }

end
