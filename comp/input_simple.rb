# type button

# executes an action


# forms / inputs

def InputSimple.default_name
  "name"
  # "label"
  # "message"
end

def InputSimple(message: InputSimple.default_name, action: "submit")
  {
    input: {
      name: message,
      right: {
        action: {
          trigger: action,
        },
      },
    },
  }
end
