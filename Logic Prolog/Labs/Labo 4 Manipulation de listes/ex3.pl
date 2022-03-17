% Exercice 3: Inverser une liste et retirer les deuxièmes éléments

% Écrivez un programme prolog, qui inverse l’ordre des éléments dans une liste et retire chaque
% deuxième élément (index = {2,4,6,…}). Le programme doit fonctionner comme suit :
% ?- reverseDrop([3,1,5,2,7,3],L).
% L = [ 7, 5, 3 ].
% ?- reverseDrop(['world','a','hello'],L).
% L = [ 'hello', 'world' ].

% REMARQUE : D'ABORD, ENLÈVE LES INDICES PAIR, PUIS RENVERSER LA LISTE.

% Réponse


reverseDrop(L, R) :- reverseDrop(L, [], keep, R), !. % no need to reverse because we are inserting to the front anyway
reverseDrop([], A, _, A) :- !.
reverseDrop([H|T], A, keep, R) :-
            insert(H, A, AA),
            reverseDrop(T, AA, remove, R).
reverseDrop([_|T], A, remove, R) :-
            reverseDrop(T, A, keep, R).


% Helper functions
% Function that reverses items in a list
renverser([],L,L) :- !.
renverser([H|T],L,R) :- renverser(T,[H|L],R).

notre_reverse(L,R) :- renverser(L,[],R).
% Function that inserts item into list
insert(A, L, [A|L]).