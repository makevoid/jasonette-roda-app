def TextField
  {
    type: "textfield",
    name: "address to field",
    value: "1antani",
    placeholder: "Enter BTC address",
    style: STYLES[:textfield].merge(
      # secure: true # for password fields
    )
  }
end
