-module(ninjad_proc_sup).
-export([start_link/2, init/1]).

start_link(MaxR, MaxT) ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, [MaxR, MaxT]).

init([MaxR, MaxT]) ->
    { ok,
      { { one_for_one, MaxR, MaxT }, [ ] } }.
