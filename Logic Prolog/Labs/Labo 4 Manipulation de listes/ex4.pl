% Exercice 4: Additionner les nombres d’une liste

% Complétez le prédicat suivant. Il doit additionner tous les nombres dans une liste et utiliser des
% signes alternatifs.
% ?- addAlternate([5,6,1],S).
% S = 0.
% ?- addAlternate([3,1,5,2,7,3],S).
% S = 9.

% Réponse

addAlternate(L,S) :- addAlternate(L, 0, p, S).
addAlternate([], A, _, A).
addAlternate([H|T], A, p, S) :- !, 
            AA is A + H,
            addAlternate(T, AA, m, S).
addAlternate([H|T], A, m, S) :- !,
            AA is A - H,
            addAlternate(T, AA, p, S).

