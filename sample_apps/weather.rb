owm_app_id = "8ecb164bf68983a3169aaf3b9cf9feb2"

lat = "$jason.coord.split(\',\')[0]"
lng = "$jason.coord.split(\',\')[1]"

url_openweathermap = "http://api.openweathermap.org/data/2.5/weather?lat={{#{lat}}}&lon={{#{lng}}}&APPID=#{owm_app_id}"

def jason_value(key)
  "{{$jason.#{key}}}"
end

alias :jval :jason_value

temperature  = "{{Math.floor(($jason.main.temp * 9/5 - 459.67)).toString()}}"
temp_celsius = "{{(Math.floor($jason.main.temp-273.15)).toString()}}"

WeatherCameraAction = {
  type: "$snapshot",
  success: {
    type: "$util.share",
    options: {
      items: [
        {
          type: "image",
          data: jval(:data)
        }
      ]
    },
    success: {
      type: "$render"
    }
  }
}

WeatherForecastDraw = {
  type: "$geo.get",
  success: {
    type: "$network.request",
    options: {
      url: url_openweathermap
    },
    success: {
      type: "$set",
      options: {
        temperature: temperature,
        celsius: temp_celsius,
        weather: jval("weather[0].description"),
        icon: "http://openweathermap.org/img/w/#{jval("weather[0].icon")}.png"
      },
      success: {
        type: "$render"
      }
    }
  }
}

WeatherActions =  {
  "$load": {
    type: "$set",
    options: {
      mode: "c"
    },
    success: {
      trigger: "draw"
    }
  },
  "$foreground": [
    {
      "{{#if \'mode\' in $get}}": {
        trigger: "draw"
      }
    },
    {
      "{{#else}}": {
        type: "$set",
        options: {
          mode: "c"
        },
        success: {
          trigger: "draw"
        }
      }
    }
  ],
  camera: WeatherCameraAction,
  toggle: {
    type: "$set",
    options: {
      mode: [
        {
          "{{#if $get.mode == \'c\'}}": "f"
        },
        {
          "{{#else}}": "c"
        }
      ]
    },
    success: {
      trigger: "draw"
    }
  },
  draw: WeatherForecastDraw
}


WeatherTemplates = {
  body: {
    style: {
      background: {
        type: "camera",
        options: {
          device: "back"
        }
      },
      color: "#ffffff",
      border: "none"
    },
    header: {
      title: " ",
      menu: {
        text: "More info...",
        href: {
          url: "http://kristinabutkute.com",
          view: "web"
        }
      },
      style: {
        background: "rgba(0,0,0,0)",
        color: "rgba(255,255,255,0.3)"
      }
    },
    layers: [
      {
        type: "image",
        url: "https://s3.amazonaws.com/www.textcast.co/icons/camera%402x.png",
        action: {
          trigger: "camera"
        },
        style: {
          bottom: "100",
          width: "30",
          move: "true",
          size: "20",
          color: "#ffffff",
          right: "30"
        }
      }
    ],
    sections: [
      {
        items: [
          {
            type: "horizontal",
            style: {
              padding_top: "50",
              background: "rgba(0,0,0,0)"
            },
            action: {
              trigger: "toggle"
            },
            components: [
              {
                type: "label",
                text: [
                  {
                    "{{#if $get.mode==\'f\'}}": " {{$get.temperature}}°F"
                  },
                  {
                    "{{#else}}": " {{$get.celsius}}°C"
                  }
                ],
                style: {
                  font: "HelveticaNeue-UltraLight",
                  color: "#ffffff",
                  size: "70",
                  align: "center"
                }
              }
            ]
          },
          {
            type: "vertical",
            style: {
              padding_bottom: "20",
              spacing: "10",
              background: "rgba(0,0,0,0)"
            },
            components: [
              {
                type: "label",
                text: "{{$get.weather}}",
                style: {
                  font: "HelveticaNeue-Light",
                  color: "#ffffff",
                  size: "20",
                  align: "center"
                }
              }
            ]
          }
        ]
      }
    ]
  }
}

Weather = {
  "head": {
    "title":      "Weather",
    "offline":    "true",
    "actions":    WeatherActions,
    "templates":  WeatherTemplates,
  }
}
