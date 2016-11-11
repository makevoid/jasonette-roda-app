
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

# example:

# audio_url = "https://jasonette.github.io/Jasonpedia/assets/1up.mp3"
#
# Audio(
#   url: audio_url
# )
