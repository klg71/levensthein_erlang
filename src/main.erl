%%%-------------------------------------------------------------------
%%% @author lukas
%%% @copyright (C) 2022, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 16. Mar 2022 12:34 PM
%%%-------------------------------------------------------------------
-module(main).
-author("lukas").

%% API
-export([start/0, lev/2]).

tail(List) ->
  [_ | T] = List,
  T.


lev(A,[])->
  string:length(A);

lev([],B)->
  string:length(B);

lev(First, Second) ->
  [A | ATail] = First,
  [B | BTail] = Second,
  if
    A == B -> lev(tail(First), tail(Second));
    true ->
      1 + lists:min([lev(ATail, Second), lev(First, BTail), lev(ATail,BTail)])
  end.

start() ->
  io:format("~w~n", [lev("kitten", "sitting")]).

