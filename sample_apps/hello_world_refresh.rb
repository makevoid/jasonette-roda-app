AppTitle = "Hello World"

def RefreshButton(label: "Refresh")
  {
    type: "label",
    text: label,
    action: {
      type: "$reload",
    },
  }
end

HelloWorldRefresh = {
  head: {
    title: AppTitle,
  },
  body: {
    sections: [{
      items: [
        {
          type: "label",
          text: AppTitle,
        },
        RefreshButton(),
      ],
    }],
  },
}
