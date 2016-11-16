
def Audio(url:, text: "Play >", type: "label", feature: {})
  {
    "type": type,
    "text": text,
    "action": {
      "type": "$audio.play",
      "options": {
        "url": url
      }
    }
  }.merge feature
end

# from the default example - head.actions
#
# {
#   actions: {
#     hahaha: {
#       type: "$audio.play",
#       options: {
#         url: "https://s3-us-west-2.amazonaws.com/fm.ethan.jason/hahaha.mp3"
#       }
#     }
#   }
# }

# example:

# audio_url = "https://jasonette.github.io/Jasonpedia/assets/1up.mp3"
#
# Audio(
#   url: audio_url
# )
