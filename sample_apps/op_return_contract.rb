AppTitle = "OP Return Contract"

# data coming directly from the bitcoin blockchain representing a smart contract


# environment / configurations

address = "1GVc1VNeTZ4wWT9XADReyWNk8JTNojRks8" # murkette




# application (main file) - data fetch

op_returns = OPReturn.all address: address




# application (main file) - view (main view)

OpReturnContract = {
  head: {
    title: "Op Return Contract - test"
  },
  body: RefreshLayout(
    [
      Label("address: #{address}"),
      Label("this is a test - the output will is an op return json value taken from this bitcoin address")
    ],
    OPReturnView(op_returns),
  ),
}
