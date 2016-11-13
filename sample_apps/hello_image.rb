AppTitle = "Hello World"

IMAGE_URLS = {
  antani: "https://upload.wikimedia.org/wikipedia/it/thumb/1/1b/Amicimiei-Tognazzi.jpg/310px-Amicimiei-Tognazzi.jpg" # antani is a word that makes no sense (like foo)
}

def Image(tag)
  url = IMAGE_URLS.fetch tag
  {
    type: "image",
    url:  url,
  }
end

def Label(text)
  {
    type: "label",
    text: text,
  }
end

def RefreshButton(label: "Refresh")
  {
    type: "label",
    text: label,
    action: {
      type: "$reload",
    },
  }
end

HelloImage = {
  head: {
    title: AppTitle,
  },
  body: {
    sections: [{
      items: [
        Label(AppTitle),
        Label("image example:"),
        Image(:antani),
        RefreshButton(),
      ],
    }],
  },
}
