-module(basic_nitrogen_cowboy_app).
-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    basic_nitrogen_cowboy_sup:start_link().

stop(_State) ->
    ok.
