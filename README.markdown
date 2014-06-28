# SimpleBridge Demo Modules

Contained here is a very simple collection of
[SimpleBridge](https://github.com/nitrogen/simple_bridge) sample modules
demonstrating basic usage of SimpleBridge 2.0.

Each demo consists of two variations: a standard version and a parameterized
module version (files ending with `_pmod`)

## demo.erl (and demo_pmod.erl)

The basic "Hello world" app

## demo2.erl (and demo2_pmod.erl)

A two-page app (and a 404 page). The index page contains a form with a textbox
to enter your name. Submitting the form redirects the user to `/show` which
will simply retrieve the POST variable and display the user's name.

## demo3.erl (and demo3_pmod.erl)

Just like `demo2`, `demo3` starts with a simple form that asks your name.
Except when you submit the form, it redirects to `/chat` which contains a
simple websocket-enabled chatroom.  This chat system uses a hyper-simple `chat`
module which is a simple `gen_server`.

## Changing backend servers

To change a backend server, you're going to need to do two things:

1. Modify the `Makefile` to make sure the program is launching with the
   appropriate server (inets, cowboy, mochiweb, yaws, webmachine).
2. Modify `rebar.config` to add the appropriate dependencies.  The current
   rebar.config has options commented out for each server.

## Running each demo

To run each demo, run `make`, then run either `make run`, `make run2` or `make
run3` to run each demo.

## Slides to accompany this

Slides accompanying this talk can be found at
http://slides.sigma-star.com/view/SimpleBridge-Full

## Copyright

Copyright (c) 2014, [Jesse Gumm](http://github.com/choptastic) ([@jessegumm](http://twitter.com/jessegumm))

Released under [MIT License](http://github.com/nitrogen/simple_bridge_demo/blob/master/LICENSE)




