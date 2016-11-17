# jasonette-roda-app

Jasonette server based roda app


**contains sample apps done with Jasonette**

---

You can use the components already prebuild for you in dist to test them out.


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


Note that the app will error complaining about config files if they're not copied (`./setup`) a fork that doesn't require those config files is <much> appreciated ;)


---

@makevoid
