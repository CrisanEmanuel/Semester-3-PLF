%model de flux numar(i,o)
numar([], []).
numar([H | T], [[H, N] | Restul]) :-
    numara_element(H, [H | T], N),
    eliminare(H, T, Rest),
    numar(Rest, Restul).

%model de flux numara_element(i,i,o)
numara_element(_, [], 0).
numara_element(E, [E | T], N) :-
    numara_element(E, T, N1),
    N is N1 + 1.
numara_element(E, [X | T], N) :-
    E \= X,
    numara_element(E, T, N).

%model de flux eliminare(i,i,o)
eliminare(_, [], []).
eliminare(E, [E | T], Rest) :-
    eliminare(E, T, Rest).
eliminare(E, [X | T], [X | Rest]) :-
    E \= X,
    eliminare(E, T, Rest).

test :- numar([1,2,1,2,1,3,1,1],[[1,5],[2,2],[3,1]]).