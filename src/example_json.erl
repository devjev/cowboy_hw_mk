-module(example_json).
-behavior(cowboy_handler).

-export([init/2]).

init(Req0, State) ->
	Data = #{
		<<"response">> => #{
			<<"name">> => <<"example json">>,
			<<"application">> => <<"cowboy_hw_mk">>,
			<<"hash">> => 16#deadbeef
		}
	},
	Json = jiffy:encode(Data),
	Req = cowboy_req:reply(200,
		#{
			<<"content-type">> => <<"application/json">>,
			<<"server">> => "none-of-your-business"
		},
		Json,
		Req0),
	{ok, Req, State}.
