-module(filter).
-export([filter/2]).

%N integer, show number when N =< number from the list
filter(List, N) ->
    filter(List, N, []).

filter([], _N, List) ->
    lists:reverse(List);
filter([H|T], N, List) when H > N ->
    filter(T, N, List);
filter([H|T], N, List) when H =< N ->
    filter(T, N, [H|List]).
    
