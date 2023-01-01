-module(basic_nitrogen_cowboy_app).
-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
	application:set_env(simple_bridge, handler, nitrogen),
	Dispatch = cowboy_router:compile([
		{'_', [
			{"/static/[...]", cowboy_static, {priv_dir, basic_nitrogen_cowboy, "web_static"}},
			{"/[...]", cowboy_simple_bridge_anchor, []}
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
