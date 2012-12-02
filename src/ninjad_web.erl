-module(ninjad_web).
-export([start_link/0]).

start_link() ->
    misultin:start_link([{port, 1337}, {loop, fun handle_http/1}]).

handle_http(Req) ->
    {ok, JSON} = json:encode({[{foo, bar}, {baz, qux}]}),
    Req:ok(JSON).
