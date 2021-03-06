require_relative '../comp/tags'

AppTitle = "Hello World"

IMAGE_URLS = {
  antani: "https://upload.wikimedia.org/wikipedia/it/thumb/1/1b/Amicimiei-Tognazzi.jpg/310px-Amicimiei-Tognazzi.jpg", # antani is a word that makes no sense (like foo)
  laser_cat: "http://www.gifbin.com/bin/052011/reverse-1306235375_cat_vs_laser_pointer.gif"
}


Test = {
  head: {
    title: "image murka",
  },
  body: Section([
    Label(AppTitle),
    Label("image example:"),
    Image(:laser_cat),
    RefreshButton(),
  ]),
}
