-module(flatten).
-export([flatten/1]).

%flatten([[[1,2,3], [], [[6,[7],8]]], [[fdsf]]]).
flatten([[]|List]) ->
    flatten(List);
flatten([[H|T1]|T2]) ->
    flatten([H|[T1|T2]]);
flatten([H|T]) ->
    [H|flatten(T)];
flatten(List) ->
    flatten(List, []).

flatten([], List) ->
    lists:reverse(List);
flatten([[]|T], List) ->
    flatten(T, List);
flatten([[H|T1]|T2], List) ->
    flatten([T1|T2], [H|List]).
