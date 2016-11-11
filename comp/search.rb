# header

#TODO

def Search()
  {
    search: {
      name: "query_text",
      placeholder: "Search something",
      style: {
        background: "#000000"
      },
      action: {
        type: "$util.alert",
        options: {
          title: "You've entered:",
          description: "{{$get.query_text}}"
        }
      }
    }
  }
end
