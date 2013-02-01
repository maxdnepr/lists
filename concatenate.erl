-module(concatenate).
-export([concat/1]).

%concat([[1,2,3], [], [erl], [a,b,c]])
concat(List) ->
    concat(List, []).

concat([], List) ->
    lists:reverse(List);
concat([[]|T], List) ->
    concat(T, List);
concat([[H|T1]|T2], List) ->
    concat([T1|T2], [H|List]).
