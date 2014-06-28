% vim: ts=4 sw=4 et
-module(demo3_pmod).
-behaviour(simple_bridge_handler).
-export([
    run/1,
    ws_init/1,
    ws_message/2,
    ws_info/2,
    ws_terminate/2
]).

run(Bridge) ->
    case Bridge:path() of
        "/" -> index(Bridge);
        "/chat" -> chat(Bridge);
        _ -> four_oh_four(Bridge)
    end.

ws_init(Bridge) ->
    Name = Bridge:query_param(name),
    chat:connect(Name).

ws_message({text, Msg}, _Bridge) ->
    chat:message(Msg),
    noreply.

ws_info(Msg, _Bridge) ->
    {reply, {text, Msg}}.

ws_terminate(_Reason, _Bridge) ->
    ok.

%% Our pages

index(Bridge) ->
    Body = "<h1>Enter your name, please</h1>
            <form action='/chat' method=post>
                Name: <input type=text name=name>
                <input type=submit text='Go!'>
            </form>",
    Bridge2 = Bridge:set_response_data(Body),
    Bridge2:build_response().

chat(Bridge) ->
    YourName = Bridge:post_param(name),
    Body = chat_body(YourName),
    Bridge2 = Bridge:set_response_data(Body),
    Bridge2:build_response().

four_oh_four(Bridge) ->
    Bridge2 = Bridge:set_status_code(404),
    Bridge3 = Bridge2:set_response_data("Not found"),
    Bridge3:build_response().

chat_body(YourName) ->
    ["<script src='/js/jquery.js'></script>
    <script src='/js/websocket.js'></script>
    <h2>Welcome, ", YourName, "</h2>
    <div id=chat></div>
    Send: <input type=text id=msg>
    <input type=button value=Send onclick=\"send_msg($('#msg').val())\">
    <script>init(\"", YourName, "\")</script>"].
