# jasonette-roda-app

Jasonette server based roda app


**contains sample apps done with Jasonette**

---

To run the app run:


    bundle


copy the (empty) default config files via:

    ./setup


that will install the dependencies, then

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
