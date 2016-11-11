IconUrl = "https://github.com/Jasonette/Twitter-UI-example/tree/master/images/%s.png"

ICONS = %i(
  home
  logo
  me
  messages
  moments
  notifications
)

def Icon(icon_name)
  available_icons = "available icons: #{ICONS}"
  raise "IconNotSpecifiedError - You have to specify an icon - #{available_icons}" unless icon_name
  icon_name = icon_name.to_sym
  raise "IconNotFoundError - The icon was not found in the available icons - To add more icons look into the `./comp/icon.rb` component - provided icon_name: #{icon_name.inspect} - #{available_icons}" unless ICONS.include? icon_name
  IconUrl % icon_name
end
