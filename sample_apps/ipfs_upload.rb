# custom tags and camera $network.request upload (requires modification to jsonette)

require_relative "../comp/tags"
require_relative "../comp/camera_upload"

AppTitle = "IPFS Upload App"

IpfsUploadHead = {
  title: AppTitle,
  actions: {
    "$load": CameraUpload(
      url: "http://mkvd.eu.ngrok.io/ipfs_add",
      quality: 0.2,
    )
  }
}

IpfsUpload = {
  head: IpfsUploadHead,
  body: Section([
    Label("Image uploaded"),
    RefreshButton(),
  ]),
}
