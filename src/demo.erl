% vim: ts=4 sw=4 et
-module(demo).
-behaviour(simple_bridge_handler).
-export([run/1]).

run(Bridge) ->
    Bridge2 = sbw:set_response_data("Hello World", Bridge),
    sbw:build_response(Bridge2).
