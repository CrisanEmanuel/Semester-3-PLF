% interclasare(l: Lista, L: Lista, Rezultat: Lista finala)
% model de flux: (i, i, o)
% l - prima lista ordonata
% L - a doua lista ordonata
% Rezultat - lista finala obtinuta prin interclasarea l si L prin eliminaarea dublurilor
interclasare([], L, L).
interclasare(L, [], L).
interclasare([X | Restul1], [Y | Restul2], [X | Rezultat]) :-X < Y,
    interclasare(Restul1, [Y | Restul2], Rezultat).
interclasare([X | Restul1], [Y | Restul2], [Y | Rezultat]) :-X > Y,
    interclasare([X | Restul1], Restul2, Rezultat).
interclasare([X | Restul1], [Y | Restul2], [Y | Rezultat]) :-X = Y,
    interclasare(Restul1, Restul2, Rezultat).


% este_lista(L: Lista)
% model de flux: (i,o)
% L - parametru de verificat daca e lista sau nu
este_lista([]). % the empty list
este_lista([_|Rest]) :- % list with at least one element
    este_lista(Rest).

% inter(l: Lista, Param: lista, Result: Lista finala)
% model de flux: (i,i,o)
% l - lista eterogena
% Param - lista colectoare, unde imi formez lista formata din sublistele interclasate
% Result - lista finala in care sunt interclasate toate sublistele din l
inter([], Param, Param).
inter([E|Rest], Param, Result) :- \+este_lista(E),
	inter(Rest, Param, Result).
inter([E|Rest], Param, Result) :- este_lista(E),
	interclasare(E, Param, Param2),
	inter(Rest, Param2, Result).


% ex de apel:
% interclasare([1,3,5], [2,4,5,7], Rezultat).
% inter([1, [2, 3], 4, 5, [1, 4, 6], 3, [1, 3, 7, 9, 10], 5, [1, 11], 8],[], Result).

