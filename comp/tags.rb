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

def Section(items)
  {
    sections: [{
      items: items
    }],
  }
end
