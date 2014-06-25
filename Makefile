all: get-deps compile

get-deps:
	rebar get-deps

compile:
	rebar compile

run:
	erl -pa ebin -pa deps/*/ebin -config simple_bridge.config -s simple_bridge
