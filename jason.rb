# this module defines Jason app - Head and Body (View) are separate - by including Jason, you get a Jason app (as a constant: Jason)

module Jason
  jason = ""

  jason = {
    head: {
      title: "SampleApp"
    }.merge(Head)
  }

  jason.merge!(
    body: View
  ) if defined?(View)

  Jason = jason
end
