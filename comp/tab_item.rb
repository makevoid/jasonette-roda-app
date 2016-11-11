require_relative 'icon'

def TabItem(url:, icon: :home, label: "Tab Item")
  {
    "image": Icon(icon),
    "text":  label,
    "style": {
      "height": "21"
    },
    "url": url
  }
end
