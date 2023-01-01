-module(basic_nitrogen_cowboy_app).
-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
	Dispatch = cowboy_router:compile([
		{'_', [
			{"/static/[...]", cowboy_static, {priv_dir, basic_nitrogen_cowboy, "web_static"}}
		]}
	]),
	{ok, _} = cowboy:start_clear(
		http_server,
		[{port, 80}],
		#{env => #{dispatch => Dispatch}}
	),
    basic_nitrogen_cowboy_sup:start_link().

stop(_State) ->
    ok.
