-module(chat).

-behaviour(gen_server).

%% API
-export([start/0,
		connect/1,
		message/1]).

%% gen_server callbacks
-export([init/1,
         handle_cast/2,
         terminate/2]).

-record(state, {clients=[]}).

start() ->
    gen_server:start( {local, ?MODULE}, ?MODULE, [], []).

connect(Name) ->
	gen_server:cast(?MODULE, {connect, self(), Name}).

message(Msg) ->
	gen_server:cast(?MODULE, {msg, self(), Msg}).

init([]) -> 
    {ok, #state{}}.

handle_cast({connect, Pid, Name}, State=#state{clients=Clients}) ->
   	New = {Pid, Name},
	NewClients = [New | Clients],
	send(NewClients, [Name," has connected"]),	
    {noreply, State#state{clients=NewClients}};

handle_cast({msg, Pid, Msg}, State=#state{clients=Clients}) ->
	{Pid, Name} = lists:keyfind(Pid, 1, Clients),
	FinalMsg = [Name,": ",Msg],
	send(Clients, FinalMsg),
	{noreply, State}.

terminate(_Reason, _State) ->
    ok.

send(Clients, Msg) ->
	[Pid ! Msg || {Pid, _} <- Clients].
