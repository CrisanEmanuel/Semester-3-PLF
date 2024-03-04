% model de flux sterge(i,i,o)
sterge(_, [], []).
sterge(X, [X|T], Result) :-
    sterge(X, T, Result).
sterge(X, [H|T], [H|Result]) :-
    H \= X,
    sterge(X, T, Result).

test :- sterge(1,[1,2,3,1],[2,3]).s