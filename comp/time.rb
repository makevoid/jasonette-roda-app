# ------------

ReloadTimer = {
  type: "$timer.start",
  options: {
    name:     "t",
    interval: "120",
    repeats:  "true",
    action: {
      type:   "$reload"
    }
  }
}

# ------------

{
  app: {},
  elements: [
    {
      element: "something..."
    }.merge(ReloadTimer),
  ],
}
