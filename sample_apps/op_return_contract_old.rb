AppTitle = "OP Return Contract"

# data coming directly from the bitcoin blockchain representing a smart contract


# main

address = "1GVc1VNeTZ4wWT9XADReyWNk8JTNojRks8" # murkette







op_returns = OPReturn.all address: address

items =  [
  Label("address: #{address}"),
  Label("this is a test - the output will is an op return json value taken from this bitcoin address")
]

items += OPReturnView(op_returns)

OpReturnContract = {
  head: {
    title: "Op Return Contract - test"
  },
  body: RefreshLayout(
    items,
  ),
}
