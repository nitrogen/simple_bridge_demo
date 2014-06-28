-module(demo2_pmod).
-behaviour(simple_bridge_handler).
-export([run/1]).

run(Bridge) ->
	case sbw:path(Bridge) of
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
	Bridge2 = sbw:set_response_data(Body, Bridge),
	sbw:build_response(Bridge2).

show(Bridge) ->
	YourName = sbw:post_param(name, Bridge),
	Body = ["<h2>Welcome, ", YourName, "</h2>"],
	Bridge2 = sbw:set_response_data(Body, Bridge),
	sbw:build_response(Bridge2).

four_oh_four(Bridge) ->
	Bridge2 = sbw:set_status_code(404, Bridge),
	Bridge3 = sbw:set_response_data("Not found", Bridge2),
	sbw:build_response(Bridge3).
