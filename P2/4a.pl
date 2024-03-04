% interclasare(l: Lista, L: Lista, Rezultat: Lista finala)
% model de flux: (i, i, o)

interclasare([], Lista, Lista).

interclasare(Lista, [], Lista).

interclasare([X | Restul1], [Y | Restul2], [X | Rezultat]) :-
    X < Y,
    interclasare(Restul1, [Y | Restul2], Rezultat).

interclasare([X | Restul1], [Y | Restul2], [Y | Rezultat]) :-
    X > Y,
    interclasare([X | Restul1], Restul2, Rezultat).

interclasare([X | Restul1], [Y | Restul2], [Y | Rezultat]) :-
    X = Y,
    interclasare(Restul1, Restul2, Rezultat).





