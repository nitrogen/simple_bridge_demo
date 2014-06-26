all: get-deps compile

get-deps:
	rebar get-deps

compile:
	rebar compile

run:
	erl -pa ebin -pa deps/*/ebin -config simple_bridge.config -eval "simple_bridge:start(inets, demo)"

run2:
	erl -pa ebin -pa deps/*/ebin -config simple_bridge.config -eval "simple_bridge:start(inets, demo2)"

run3:
	erl -pa ebin -pa deps/*/ebin -config simple_bridge.config -eval "simple_bridge:start(inets, demo3)" -eval "chat:start()"
