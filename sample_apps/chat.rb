AppTitle = "Hello World"

addr   = "http://192.168.1.2:3002/"
# addr = "http://192.168.1.2:3000/"
# addr = "http://mkvd.eu.ngrok:3002/"

Chat = {
  head: {
    title: AppTitle,

    actions: {
      "$foreground": {
        trigger: "reload",
      },
      "$load": {
        trigger: "reload"
      },
      reload: {
        type: "$network.request",
        options: {
          url: addr + "messages",
          method: "get"
        },
        success: {
          type: "$render"
        }
      },
      say: {
        type: "$network.request",
        options: {
          method: "post",
          url: addr + "messages",
          data: {
            text: "{{$get.message}}"
          }
        },
        success: {
          type: "$render"
        }
      }
    },

    templates: {
      body: {
        style: {
          border: "none",
          align: "bottom"
        },
        sections: [
          {
            items: {
              "{{#each $jason.messages}}": {
                type: "horizontal",
                style: {
                  spacing: "10"
                },
                components: [{
                  type: "image",
                  url: "{{avatar}}",
                  style: {
                    width:  "30",
                    height: "30",
                    corner_radius: "15"
                  }
                },
                {
                  type: "label",
                  style: {
                    font: "Courier",
                    size: "14"
                  },
                  text: "{{text}}"
                }]
              }
            }
          }
        ],
        
        footer:{
          input: {
            name: "message",
            right: {
              action: {
                trigger: "say"
              }
            }
          }
        }
      }
    }
  }
}
