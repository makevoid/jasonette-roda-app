# jasonette-roda-app

Jasonette server based roda app


**contains sample apps done with Jasonette**

---

You can use the components already prebuild for you in dist to test them out.

You can load them directly from github - example: https://raw.githubusercontent.com/makevoid/jasonette-roda-app/master/dist/hello_world_kb.json (made by @kristinab lol)


If you want to re-build them (`ruby build.rb`) you need to perform a quick setup first:


---

Assuming you have ruby installed (and bundler, `gem i bundler`)


Then, to install the dependencies run:


    bundle


copy the (empty) default config files via:

    ./setup


this is to re-build the components in dist

 ruby build.rb


or/and this is to start the interactive app / server

    rackup

or more explicitly:

    bundle exec rackup


and visit http://localhost:9292 or the equivalent local host


    rackup -o 0.0.0.0

will bind on any port, `-p` will let you change the port


---

run with `rerun` to have simple code-reloading:

`rerun "**/*.{rb}" -- rackup -o 0.0.0.0`

or a with a more detailed command:

`rerun -s KILL -p "**/*.{rb}" -- bundle exec rackup -o 0.0.0.0`

enjoy!

---

### Sample Hello world Code


```ruby

AppTitle = "Hello World"

IMAGE_URLS = {
  antani: "https://upload.wikimedia.org/wikipedia/it/thumb/1/1b/Amicimiei-Tognazzi.jpg/310px-Amicimiei-Tognazzi.jpg", # antani is a word that makes no sense (like foo)
  laser_cat: "http://www.gifbin.com/bin/052011/reverse-1306235375_cat_vs_laser_pointer.gif"
}



HelloWorldKb = {
  head: {
    title: "Lazer Cat",
  },
  body: Section([
    Label(AppTitle),
    Label("jasonette image example:"),
    Image(:laser_cat),
    RefreshButton(),
  ]),
}

```


### Simple Components definition


Take a look at:

#### https://github.com/makevoid/jasonette-roda-app/blob/master/comp/tags.rb


it's a win-win


#### Output:

https://github.com/makevoid/jasonette-roda-app/blob/master/dist/hello_world_kb.json


make sure to check out more/others (more complex but more interesting) examples and try to run jasonette on your device so that all of this makes sense!

I suggest to put a ngrok url (paid) or similar proxying/forwarding solution / custom dns url on it or it would be nice for jasonette to support 1 redirect - managing a dns server with a low ttl / preventing dns cache can be an option too

---


Note that the app will error complaining about config files if they're not copied (`./setup`) a fork that doesn't require those config files is <much> appreciated ;)


---

notes from @ethan / @gl

for an IPFS version of Jasonette based entirely (normal jsonette enable support for IPFS)

IFPS Action in Jsonette - #jsonette #integration

1. Write an JasonIpfsAction which converts a ipfs hash into an `url`
2. Write a seed JSON and open it as data-uri (so it doesn’t need to be hosted anywhere)
3. And in that seed JSON you make a $network.request call to the ipfs url we acquired from step 1.


(note: sounds cool! #TODOs)


---

@makevoid
