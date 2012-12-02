-module(ninjad_sup).
-behaviour(supervisor).
-export([start_link/0, init/1]).

start_link() ->
    {ok, Pid} = supervisor:start_link({local, ?MODULE}, ?MODULE, []),
    add_proc_sup(Pid, 5, 10).

init([]) ->
    { ok,
      { { one_for_one, 5, 10 }, [ ] } }.

add_proc_sup(Sup, MaxR, MaxT) ->
    supervisor:start_child(
        Sup,
        { ninjad_proc_sup,
          { ninjad_proc_sup, start_link, [ MaxR, MaxT ] },
          permanent, infinity, supervisor, [ ninjad_proc_sup ] } ).
