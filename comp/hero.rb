# Hero content

def Hero(title: "Hello World", text: "")
  {
    sections: [{
      items: [{
        type: "label",
        text: title,
        style: {
          color: "#ff0000",
          font:  "HelveticaNeue-Bold",
          size:  "23",
        },
      }, {
        type: "label",
        text: text,
      }],
    }],
  }
end
