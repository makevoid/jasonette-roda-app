# padded and spaced list - from: https://jasonette.github.io/documentation/layout/#example-3-padding-and-spacing

def ListSimple

  {
    type: "vertical",
    style: {
      padding: "50",
      spacing: "10"
    },
    components: [
      {
        type: "label",
        class: "label_class",
        text: "First row"
      }, {
        type: "label",
        class: "label_class",
        text: "Second row"
      }, {
        type: "label",
        class: "label_class",
        text: "Third row"
      }
    ]
  }

end
