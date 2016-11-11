# main view and main app data

URLS = {
  home:    "https://raw.githubusercontent.com/Jasonette/Twitter-UI-example/master/home.json",
  screen1: "https://raw.githubusercontent.com/Jasonette/Twitter-UI-example/master/home.json",
}

Title = "Componentized Jasonette App"


# hero view

Body = Hero(
  title: Title,
  text:  "Template generated via Ruby Components",
)

# map view

require_relative 'comp/map_sample'
Body = MapSample()


# tabbed layout

View = TabbedLayout(
  title: Title,
  body:  Body,
)
