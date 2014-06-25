-module(sbdemo_handler).
-behaviour(simple_bridge_handler).
-export([run/1]).

run(Bridge) ->
	Bridge2 = Bridge:set_response_data("Hello World"),
	Bridge2:build_response().
