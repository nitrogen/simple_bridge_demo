% vim: ts=4 sw=4 et
-module(demo2_pmod).
-behaviour(simple_bridge_handler).
-export([run/1]).

run(Bridge) ->
	case Bridge:path() of
		"/" -> index(Bridge);
		"/show" -> show(Bridge);
		_ -> four_oh_four(Bridge)
	end.

index(Bridge) ->
	Body = "<h1>Enter your name, please</h1>
			<form action='/show' method=post>
				Name: <input type=text name=name>
				<input type=submit text='Go!'>
			</form>",
	Bridge2 = Bridge:set_response_data(Body),
	Bridge2:build_response().

show(Bridge) ->
	YourName = Bridge:post_param(name),
	Body = ["<h2>Welcome, ", YourName, "</h2>"],
	Bridge2 = Bridge:set_response_data(Body),
	Bridge2:build_response().

four_oh_four(Bridge) ->
	Bridge2 = Bridge:set_status_code(404),
	Bridge3 = Bridge2:set_response_data("Not found"),
	Bridge3:build_response().
