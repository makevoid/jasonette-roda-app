require_relative 'tab_item'

def TabbedLayout(title:, body:)
  {
    # header (simple) ------------------ # TODO: make switchable, more complex header
    "header": {
      "title": title
    },

    # body (yields) ------------------
    "body": body,

    # footer (tabs) ------------------
    "footer": {
      "tabs": {
        "style": {
          "background":     "rgba(255,255,255,0.8)",
          "color:disabled": "#cecece",
          "color":          "#009efa",
        },
        "items": [
          TabItem(
            label: "Home",
            icon:  :home,
            url:   URLS[:home],
          ),
          TabItem(
            label: "Screen 1",
            icon:  :me,
            url:   URLS[:screen1],
          ),
        ],
      },
    },
  }
end
