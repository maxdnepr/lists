-module(db).
-export([new/0, write/3, read/2, match/2, delete/2]).

new() ->
    [].

write(Name, Surname, List) ->
    [{Name, Surname}|List].

read(_Name, []) ->
    [];
read(Name, [{Name, Surname}|T]) ->
    read(Name, T),
    {ok, Surname};
read(NameA, [{_NameB, _Surname}|T]) ->
    read(NameA, T),
    {error, instance}.

match(_Surname, []) ->
    [];
match(Surname, [{Name, Surname}|T]) ->
    [Name|match(Surname, T)];
match(SurnameA, [{_Name, _SurnameB}|T]) ->
    match(SurnameA, T).

delete(Name, List) ->
    delete(Name, List, []).

delete(_Name, [], List) ->
    List;
delete(Name, [{Name, _Surname}|T], List) ->
    delete(Name, T, List);
delete(NameA, [{NameB, Surname}|T], List) ->
    delete(NameA, T, [{NameB, Surname}|List]).

