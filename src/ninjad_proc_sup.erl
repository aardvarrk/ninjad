-module(ninjad_proc_sup).
-behaviour(supervisor).
-export([start_link/2, init/1]).

start_link(MaxR, MaxT) ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, [MaxR, MaxT]),
    ninjad_proc:start_link().

init([MaxR, MaxT]) ->
    { ok,
      { { one_for_one, MaxR, MaxT },
        [ { ninjad_proc,
            { ninjad_proc, start_link, [ ] },
            permanent, infinity, worker, [ ninjad_proc ] } ] } }.
