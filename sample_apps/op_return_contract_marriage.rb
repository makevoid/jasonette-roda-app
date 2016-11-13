AppTitle = "OP Return Contract"

# data coming directly from the bitcoin blockchain representing a smart contract


# main

address = "12RXhCqxnXgJyfJLL2mvcqT3jCQ2o6rMAR" # marriage contract

op_returns = OPReturn.all address: address

items =  [
  Label("address: #{address}"),
]

items += OPReturnView(op_returns)

OpReturnContractMarriage = {
  head: {
    title: "Op Return Contract - marriage"
  },
  body: RefreshLayout(
    items,
  ),
}
