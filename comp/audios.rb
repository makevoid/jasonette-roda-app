require_relative 'audio'

AUDIO_URLS = %w(
  https://jasonette.github.io/Jasonpedia/assets/1up.mp3
  https://jasonette.github.io/Jasonpedia/assets/1up.mp3
  https://jasonette.github.io/Jasonpedia/assets/1up.mp3
)

Audios = AUDIO_URLS.map do |url|
  Audio(
    url: url
  )
end

# s3 audios
