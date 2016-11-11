# HTML view

# TODO:

# https://jasonette.github.io/documentation/templates/#html

actions = {
  type: "$network.request",
  options: {
    url: "http://www.techmeme.com/river",
    data_type: "html"
  },
  success: {
    type: "$render",
    options: {
      type: "html"
    }
  }
}

View = {
  "$jason": {
    head: {
      actions: actions,
      templates: {
        body: {
          sections: [
            {
              items: {
                "{{#each $jason.find('tr.rite')}}": {
                  type: "vertical",
                  components: [
                    {
                      type: "label",
                      text: "{{$(this).find('td > a').text()}}"
                    },
                    {
                      type: "label",
                      text: "{{$(this).find('cite').text()}}"
                    },
                    {
                      type: "label",
                      text: "{{$(this).find('td').first().text() + '  ' + $(this).closest('table').prev().text()}}"
                    }
                  ],
                  href: {
                    view: "web",
                    url: "{{$(this).find('td > a').attr('href')}}"
                  }
                }
              }
            }
          ]
        }
      }
    }
  }
}
