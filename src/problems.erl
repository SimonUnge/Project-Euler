%%% Project Euler Problems
%%% Simon Unge

-module (problems).
-include_lib("eunit/include/eunit.hrl").

-export ([
          problem_1/0,
          problem_2/0,
          problem_3/0,
          problem_4/0
          ]).


%% Problem 1

problem_1() ->
	{ok, lists:sum(lists:filter(fun(X) -> (X rem 5 =:= 0) or (X rem 3 =:= 0) end, lists:seq(1,999)))}.

%% Problem 2

problem_2() ->
	{ok, lists:sum(lists:filter(fun(N) -> N rem 2 =:= 0 end, peutils:fib_sequence(4000000)))}.


%% Problem 3

problem_3() ->
	[H|_] = peutils:prime_div(600851475143),
  {ok, H}.

%% Problem

problem_4() ->
  L = peutils:gen_palindromes(100,999),
  {ok, tlists:max(L)}.

%% Tests

problems_test_() ->
    {inparallel, [
     ?_assertEqual(233168, problem_1()),
     ?_assertEqual(4613732, problem_2()),
     ?_assertEqual(6857, problem_3()),
     ?_assertEqual(906609, problem_4)
    ]}.

