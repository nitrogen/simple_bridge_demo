REBAR=./rebar

all: get-deps compile

get-deps:
	$(REBAR) get-deps

compile:
	$(REBAR) compile

run:
	erl -pa ebin -pa deps/*/ebin -config simple_bridge.config -eval "simple_bridge:start(cowboy, demo)"

run2:
	erl -pa ebin -pa deps/*/ebin -config simple_bridge.config -eval "simple_bridge:start(cowboy, demo2)"

run3:
	erl -pa ebin -pa deps/*/ebin -config simple_bridge.config -eval "simple_bridge:start(cowboy, demo3)" -eval "chat:start()"
