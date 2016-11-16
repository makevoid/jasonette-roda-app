# example from jsonette documentation

bg_image = "http://i.giphy.com/l41YybJPL0z2n1snm.gif"

items = [
  {
    "action": {
      "trigger": "hahaha"
    },
    "type": "horizontal",
    "style": {
      "padding_right": "20",
      "height": "300"
    },
    "components": [
      {
        "type": "label",
        "text": "Touch\nme!",
        "style": {
          "color": "#ffffff",
          "size": "30",
          "padding": "0",
          "align": "right",
          "font": "HelveticaNeue-Bold"
        }
      }
    ]
  }
]

AudioGif = {
  "head": {
    "title": "Vault boy",
    "description": "Touch the vault boy to hear him laugh for you.",
    "preview": "http://i.giphy.com/l41YybJPL0z2n1snm.gif",
    "actions": {
      "hahaha": {
        "type": "$audio.play",
        "options": {
          "url": "https://s3-us-west-2.amazonaws.com/fm.ethan.jason/hahaha.mp3"
        }
      },
      "filename2": {
        "type": "$audio.play",
        "options": {
          "url": "https://s3-us-west-2.amazonaws.com/fm.ethan.jason/filename2.mp3"
        }
      }
    }
  },
  "body": {
    "header": {
      "style": {
        "color": "#ffffff",
        "background": "rgba(0,0,0,0)"
      }
    },
    "style": {
      "border": "none",
      "background": bg_image
    },
    "sections": [
      {
        "items": items
      }
    ]
  }
}
