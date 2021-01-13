-module(cowboy_hw_mk_app).
-behaviour(application).

-export([start/2]).
-export([stop/1]).

start(_Type, _Args) ->
	Dispatch = cowboy_router:compile([
		{'_', [
			{"/", hello_handler, []},
			{"/api/example-json", example_json, []} ]
		}
	]),
	{ok, _} = cowboy:start_clear(my_http_listener, [{port, 3030}], #{env => #{dispatch => Dispatch}}),
	cowboy_hw_mk_sup:start_link().

stop(_State) ->
	ok.
