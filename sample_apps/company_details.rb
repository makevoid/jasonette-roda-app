# require statements (load libs or vendored libs)

require_relative "../comp/map"


# configs

AppTitle = "Company Details"

logo_url = "http://appliedblockchain.co.uk/wp-content/uploads/2016/10/appliedblockchain_wide_color.png"

logo = logo_url
IMAGE_URLS[:logo] = logo

# location (place)
one_canada_square = { lat: 51.504855, lng: -0.019441 } # 51.504855,-0.019441



# -------------

# sample map data (center + pins)

# MapSampleElements = {}
# MSE = MapSampleElements
MSE = {}

# this is your map center

MSE[:map_center] = one_canada_square

# these are your map pins

MSE[:map_pins]   = [
  {
    title: "Applied Blockchain - Level39",
    coord: one_canada_square
  },
]

# this is the map component, feeded with the datas (bonus exercise: make the data come from an external api)

def MapSample
  Map(
    center: MSE[:map_center],
    pins:   MSE[:map_pins]
  )
end


# basic components

def Image(tag)
  url = IMAGE_URLS.fetch tag
  {
    type: "image",
    url:  url,
  }
end

def Label(text)
  {
    type: "label",
    text: text,
  }
end

def RefreshButton(label: "Refresh")
  {
    type: "label",
    text: label,
    action: {
      type: "$reload",
    },
  }
end



CompanyDetails = {
  head: {
    title: AppTitle,
  },
  body: {
    header: { title: AppTitle, style: { shy: true } },
    sections: [{
      items: [
        Label(AppTitle),
        Label("map example: - AppliedBlockchain - Blockchain Technologies"),
        Image(:logo),
        MapSample(),
        RefreshButton(),
      ],
    }],
  },
}
