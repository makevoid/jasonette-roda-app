require_relative "../comp/tags"

AppTitle = "IPFS Upload done!"

IMAGE_URLS = {
  laser_cat: "http://www.gifbin.com/bin/052011/reverse-1306235375_cat_vs_laser_pointer.gif"
}


IpfsUploadAdd = {
  head: {
    title: AppTitle,
  },
  body: Section([
    Label(AppTitle),
    Label("jasonette image example:"),
    Image(:laser_cat),
    RefreshButton(),
  ]),
}
