Components dir

---


---

this dir currently contains a lot of component example, you can look at them or just delete them all at once with: `are_you_sure && rm -rf comp/*.rb`

---

An ideal API could be done by wrapping every component into a function or in a variable (a class with a common method - `render()` for example can be done too)

#### Components

definition of components can be in three form,


#### form 1

```ruby
Comp = {}
```

#### form 2

```ruby
def Comp
  {}
end
```

#### form 3

```ruby
class Comp
  def render
    {}
  end
end
```

And of course these are the three way to invoke (execute) the defined method.

```ruby
Comp

Comp()
```

note: first two are interchangeables


but! the important thing is that the component api is based on a ruby object that gets serialized to json, then the json will map to native components (and bind to actions) afterwards

A good option is to run all the app code on the devices trough a objc/swift static file server (can be found in projects like cordova, it can be done with standard cocoa api or simply using a library like - https://github.com/httpswift/swifter) - read file from resource dir, store it as NSData in memory so that it's served from disk (to make an offline app for example) - serving a file from network is very useful because you can change all of your jasonatte app but from disk it's surely faster

The app jasonette builds is a native app so it can be something that full web based framework can envy about jasonette.

Running a forked version of jasonette with a patch to make a 'native' functionality available to your jasonette (json/jason) environment can be very desirable, especially because jasonette is still pretty new atm (but very promising!)

Use swifter or an alternative ruby server (or other means) to serve your json requests directly on the device and you will achieve a fast-to-load app.

Ideally you want to load buttons to actions that the user can do (sub sections / network requests / action queued / details screen ...)

also you want to load views filled with cached data (example, if you cache weather data for a weather app so if the user closes and re-opens the app in a 10 minutes interval you reload the weather data from disk)
