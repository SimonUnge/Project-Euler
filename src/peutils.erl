-module(peutils).
-include_lib("eunit/include/eunit.hrl").

-export([
         fib_sequence/1,
         initiate_sieve/1,
         is_prime/1,
         is_prime_with_list/2,
         prime_sequence/1,
         prime_div/1
         ]).

%% Fib sequence
%% creates a list of fib numbers upto Upto.
%% Example: fib_sequence(14) -> [1,2,3,5,8,13]

fib_sequence(UpTo) when UpTo > 0 ->
    lists:reverse(fib_sequence(0, 1, UpTo)).

fib_sequence(X, Y, UpTo) when X + Y =< UpTo - Y ->
    fib_sequence(Y, X + Y, UpTo) ++ [X + Y];
fib_sequence(X, Y, _UpTo) ->
    [X + Y].

%% Sieve of Atkin
initiate_sieve(N) ->
    initiate_sieve(N,[]).

initiate_sieve(1, L) ->
    [{1, non_prime}| L];
initiate_sieve(N, L) when N > 1 ->
    initiate_sieve(N-1, [{N, non_prime} | L]).

is_prime(N) ->
    lists:member(N,prime_sequence(N)).

is_prime_with_list(N, L) ->
    lists:member(N, L).

%% Prime sequence

prime_sequence(N) ->
    prime_sequence([], lists:seq(3,N,2)).

prime_sequence(P,[]) -> P;
prime_sequence(P,[H|T]) ->
    prime_sequence([H|P],[X || X <- T, X rem H =/= 0]).

%% Prime dividers.

prime_div(N) ->
    Square_N = trunc(math:sqrt(N)),
    Prime_seq = prime_sequence(Square_N),
    [X || X <- Prime_seq, N rem X =:= 0].

%%%%%%%%%%
%% Tests
%%%%%%%%%%
peutils_test_() ->
    {inparallel, [
     ?_assertEqual([1,2,3,5,8,13], fib_sequence(20)),
     ?_assertEqual([1,2,3,5,8,13,21], fib_sequence(21)),
     ?_assertEqual([1,2,3,5,8,13,21], fib_sequence(22)),
     ?_assertEqual(true, is_prime(7)),
     ?_assertEqual(false, is_prime(8))
    ]}.
