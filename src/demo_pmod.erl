% vim: ts=4 sw=4 et
-module(demo_pmod).
-behaviour(simple_bridge_handler).
-export([run/1]).

run(Bridge) ->
	Bridge2 = Bridge:set_response_data("Hello World"),
	Bridge2:build_response().
