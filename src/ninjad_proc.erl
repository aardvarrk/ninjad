-module(ninjad_proc).
-export([start_link/0, init/0]).

start_link() ->
    Pid = spawn_link(?MODULE, init, []),
    {ok, Pid}.

init() ->
    io:format("foo~n").
