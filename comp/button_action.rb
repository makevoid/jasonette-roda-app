# type button

# executes an action

# ---------------------------

# button to execute (trigger) an action - perfect for triggering web requests (POST JSON requests) - because the environment is not a browser you don't have to think about CORS #jasonette #thumbsup

def ButtonAction(message: ButtonAction.default_name, action: "submit")
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
