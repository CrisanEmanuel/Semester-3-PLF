% Sa se insereze dupa fiecare element de pe pozitia 1,2,4,8.. un element dat
% Exemplu add([1,2,3,4,5,6], 1, 11, Rezultat) => Rezultat = [1, 11, 2, 11, 3, 4, 11, 5, 6];

% Predicatul care verifică dacă un număr este putere a lui 2
% Model de flux putere_doi(N: i)
% N numarul de verificat daca este putere a lui 2
putere_doi(1).
putere_doi(N) :-
    N > 1,
    N mod 2 =:= 0,
    Next is N // 2,
    putere_doi(Next).


% Model de flux add(Lista: i, Poz: i, Elem: i, Rezultat:o)
% Lista - lista de numere data pentru a fi inserata in ea elementul Elem
% Poz - variabila care ajuta la verificarea pozitiei in sir
% Elem - elementul de introdus in lista
% Rezultat - lista finala care se formeaza prin adaugarea elementului Elem pe pozitiile dorite
	
add([], _, _, []).
add([X|Rest], Poz, Elem, [X,Elem|Rezultat]) :-
	putere_doi(Poz),
	Poz1 = Poz + 1,
	add(Rest, Poz1, Elem, Rezultat).
add([X|Rest], Poz, Elem, [X|Rezultat]) :-
	\+ putere_doi(Poz),
	Poz1 = Poz + 1,
	add(Rest, Poz1, Elem, Rezultat).



% Model matematic
%                  
%                      { putere(Numar/2)    daca Numar > 1 si Numar mod 2 = 0
%  putere_doi(Numar) = { false              daca Numar > 1 si Numar mod 2 != 0
%		       { true               altfel
%
%                           { []                                     daca a1..an este vida
%  add(a1..1n, Poz, Elem) = { a1 U Elem U add(a2..an, Poz+1, Elem)   daca putere_doi(Poz)
%                           { a1 U add(a2..an, Poz+1, Elem)          altfel
%