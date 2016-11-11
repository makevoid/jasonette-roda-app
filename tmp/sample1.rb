# View next (haml to json) # TODOTODO

:ruby
  imgDataAddr = "http://"
  mapAddr     = "http://"
  # imgDataAddr = "base64"
  # imgDataKey  = QrCode.make private_key

%header{ title: "SampleApp", style: { shy: true } }
%sections
  %items
    # - for item in section.items
    %label "Address"
    %img{ url: imgDataAddr }


    %label "Address (static map with link)"
    %a{ href: "" }
      %img{ url: mapAddr }


etc...

  {type: "label", text: "Private Key"},
  {type:"image",  url: imgDataKey},
