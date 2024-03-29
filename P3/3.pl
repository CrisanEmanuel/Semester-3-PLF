% Predicat pentru a verifica dacă o listă este strict crescătoare
strict_crescatoare([]).
strict_crescatoare([_]).
strict_crescatoare([X, Y | Rest]) :- X < Y, strict_crescatoare([Y | Rest]).

% Predicat pentru a genera toate subsirurile strict crescătoare ale unei liste
subsir_crescator([], []).
subsir_crescator([X | Rest], [X | Subsir]) :- 
    	subsir_crescator(Rest, Subsir),
    	strict_crescatoare([X | Subsir]).
subsir_crescator([_ | Rest], Subsir) :- 
	subsir_crescator(Rest, Subsir).

% Predicat principal pentru a obține toate subsirurile strict crescătoare ale unui șir
toate_subsirurile_crescatoare(Lista, Subsiruri) :-
    findall(Subsir, subsir_crescator(Lista, Subsir), Subsiruri).







